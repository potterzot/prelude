(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1989847d22966b1403bab8c674354b4a2adf6e03e0ffebe097a6bd8a32be1e19" default)))
 '(jabber-resource-line-format "     %r - %s"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((t (:foreground "#B58900" :inverse-video nil :underline nil :slant normal :weight normal))))
 '(header-line ((t (:inherit mode-line :foreground "#2aa198"))))
 '(helm-candidate-number ((t (:foreground "#839496"))))
 '(helm-ff-directory ((t (:foreground "#2AA198"))))
 '(helm-ff-dotted-directory ((t (:foreground "#657b83"))))
 '(helm-ff-executable ((t (:foreground "#d33682"))))
 '(helm-selection ((t (:background "dark slate gray"))))
 '(helm-source-header ((t (:foreground "#839496" :weight bold :height 1.1 :family "Sans Serif"))))
 '(jabber-chat-prompt-foreign ((t (:foreground "#B58900" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(jabber-chat-prompt-local ((t (:foreground "#2AA198" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(jabber-roster-user-away ((t (:foreground "#2AA198" :inverse-video nil :underline nil :slant italic :weight normal))))
 '(jabber-roster-user-dnd ((t (:foreground "#DC322F" :inverse-video nil :underline nil :slant italic :weight normal))))
 '(jabber-roster-user-error ((t (:foreground "#DC322F" :slant italic :weight light))))
 '(jabber-roster-user-online ((t (:foreground "#B58900" :inverse-video nil :underline nil :slant normal :weight normal))))
 '(jabber-roster-user-xa ((t (:foreground "#839496" :inverse-video nil :underline nil :slant italic :weight normal))))
 '(mode-line-buffer-id ((t (:foreground "#2aa198")))))

(prelude-require-packages '(ess
                            floobits
                            jabber
                            key-combo
                            markdown-mode
                            org
                            polymode
                            solarized-theme
                            sublime-themes
                            twittering-mode))

;; Remap meta and super on Mac
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Fill paragraphs at 80 characters
(setq-default fill-column 80)

;; Set default directory to home
(setq default-directory "~/")

;; Disable whitespace mode
(setq prelude-whitespace nil)

;; C-x C-b should bring up ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Function to swap buffer orientation
;; http://www.emacswiki.org/emacs/ToggleWindowSplit
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x 5") 'toggle-window-split)


;;; ESS ---------------------------------------------------

;; Activate ESS
(require 'ess-site)

;; Smartparens in R repl
(add-hook 'ess-R-post-run-hook 'smartparens-mode)

;; Disable conversion of underscores to arrows; map to M-- instead
(ess-toggle-underscore nil)
(setq ess-S-assign-key (kbd "M--"))
(add-hook 'ess-mode-hook (lambda () (ess-toggle-S-assign-key t)))

;; Indentation the way I want
;; http://emacs.1067599.n5.nabble.com/indentation-of-ggplot-code-and-ess-13-09-02-td322315.html#a322335
(add-to-list 'ess-style-alist
	     '(khw-R (ess-indent-level . 2)
                     (ess-first-continued-statement-offset . 2)
                     (ess-continued-statement-offset . 0)
                     (ess-brace-offset . 0)
                     (ess-arg-function-offset . 4)
                     (ess-arg-function-offset-new-line . '(4))
                     (ess-expression-offset . 4)
                     (ess-else-offset . 0)
                     (ess-close-brace-offset . 0)))
(setq ess-default-style 'khw-R)

;; Don't restore history or save on exit
(setq-default inferior-R-args "--no-restore-history --no-save")

;; Don't ask me for a directory on startup
(setq ess-ask-for-ess-directory nil)

;; Make M-return do a lot of things: start R repl next to script, send
;; highlighted code to console, or send current line to console
;; http://kieranhealy.org/blog/archives/2009/10/12/make-shift-enter-do-a-lot-in-ess/
(defun my-ess-start-R ()
  (interactive)
  (if (not (member "*R*" (mapcar (function buffer-name) (buffer-list))))
      (progn
        (delete-other-windows)
        (setq w1 (selected-window))
        (setq w1name (buffer-name))
        (setq w2 (split-window w1 nil t))
        (R)
        (set-window-buffer w2 "*R*")
        (set-window-buffer w1 w1name))))
(defun my-ess-eval ()
  (interactive)
  (my-ess-start-R)
  (if (and transient-mark-mode mark-active)
      (call-interactively 'ess-eval-region)
    (call-interactively 'ess-eval-line-and-step)))
(add-hook 'ess-mode-hook
          '(lambda()
             (local-set-key [(M-return)] 'my-ess-eval)))

;; Use s-return to set directory to location of current file
(add-hook 'ess-mode-hook
          '(lambda()
             (local-set-key [(s-return)] 'ess-use-this-dir)))


;;; Google Translate --------------------------------------

(setq google-translate-translation-directions-alist '(("ru" . "en") ("en" . "ru")))


;;; Helm --------------------------------------------------

;; Give me my damn tab completion
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)


;;; Jabber ------------------------------------------------

;; Set up google talk
(setq jabber-account-list
      '(("woo.kara@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl)
         (:port . 443))))

;; No avatars, please
(setq jabber-avatar-verbose nil
      jabber-vcard-avatars-retrieve nil)

(setq jabber-roster-line-format " %c %n - %s")

;; Don't show status changes in minibuffer
(setq jabber-alert-presence-message-function nil)

;; Enable history
(setq jabber-history-enabled nil)

;; Shorten buffer names
(setq jabber-chat-buffer-format "*-jabber-%n-*"
      jabber-roster-buffer "*-jabber-*")

;;; Key-combo ---------------------------------------------

(global-key-combo-mode t)

(defvar ess-key-combos
  '(("+"  . ("+" " + "))
    ("-"  . ("-" " - "))
    ("*"  . ("*" " * "))
    ("/"  . ("/" " / "))
    (">"  . (">" " %>% "))))

(key-combo-define-hook '(ess-mode-hook inferior-ess-mode-hook)
                       'ess-key-combo-load-default
                       ess-key-combos)


;;; Markdown ----------------------------------------------

;; Don't strip trailing whitespace in markdown mode
(add-hook 'markdown-mode-hook
          (lambda ()
            (make-local-variable 'prelude-clean-whitespace-on-save)
            (setq-local prelude-clean-whitespace-on-save nil)))


;;; Org ---------------------------------------------------

;; Disable whitespace mode in org mode
(add-hook 'org-mode-hook (lambda () (whitespace-mode -1)))

;; Visual line mode
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

;; Disable folding on startup in org
(setq org-startup-folded nil)

;; Start indented in org
(setq org-startup-indented t)

;; Add smartparens
(smartparens-global-mode t)
(sp-local-pair 'org-mode "~" "~")
(sp-local-pair 'org-mode "/" "/")
(sp-local-pair 'org-mode "*" "*")

;; Markdown export please
(setq org-export-backends `(markdown html))

;; Collapse emphasis marks in org mode
(setq org-hide-emphasis-markers t)

;; Org header for non .org files that I want to open in org mode
(defun insert-org-header ()
  (interactive)
  (save-excursion
    (goto-line 1)
    (end-of-line)
    (insert " -*- mode: org -*-")))


;;; Polymode ----------------------------------------------

(require 'poly-R)
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))


;;; Yasnippet ---------------------------------------------

(yas-global-mode t)



(provide 'custom)


;;; custom.el ends here
