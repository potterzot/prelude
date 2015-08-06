(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1989847d22966b1403bab8c674354b4a2adf6e03e0ffebe097a6bd8a32be1e19" default)))
 '(flycheck-lintr-linters
   " default_linters[-which(names(default_linters) %in%
c(\"object_camel_case_linter\", \"trailing_blank_lines_linter\"))]")
 '(jabber-resource-line-format "     %r - %s")
 '(magit-use-overlays nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "Input"))))
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

(prelude-require-packages '(emoji-cheat-sheet-plus
                            ess
                            floobits
                            jabber
                            key-combo
                            markdown-mode
                            org
                            ox-gfm
                            ox-pandoc
                            polymode
                            projectile
                            solarized-theme
                            sublime-themes
                            twittering-mode
                            wgrep))

;; Load flip-tables & shrug
(defvar load-personal-config-list)
(setq load-personal-config-list '("/flip-tables.el"
                                  "/shrug.el"))

(mapc (lambda (rmd-file-name)
        (load (concat prelude-personal-dir rmd-file-name)))
      load-personal-config-list)

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

;; And C-c C-b should eval-buffer wtf why did this disappear?
(global-set-key (kbd "C-c C-b") 'eval-buffer)

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

;; Insert iso-date
(defun insert-iso-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d" (current-time))))

;; Modifications to kill-sentence so that it doesn't delete the period when
;; point is in the middle of a sentence.
;; http://emacs.stackexchange.com/a/12321/7060
(defun my/forward-to-sentence-end ()
  "Move point to just before the end of the current sentence."
  (forward-sentence)
  (backward-char)
  (unless (looking-back "[[:alnum:]]")
    (backward-char)))

(defun my/beginning-of-sentence-p ()
  "Return  t if point is at the beginning of a sentence."
  (let ((start (point))
        (beg (save-excursion (forward-sentence) (forward-sentence -1))))
    (eq start beg)))

(defun my/kill-sentence-dwim ()
  "Kill the current sentence up to and possibly including the punctuation.
When point is at the beginning of a sentence, kill the entire
sentence. Otherwise kill forward but preserve any punctuation at the sentence end."
  (interactive)
  (if (my/beginning-of-sentence-p)
      (progn
        (kill-sentence)
        (just-one-space)
        (when (looking-back "^[[:space:]]+") (delete-horizontal-space)))
    (kill-region (point) (progn (my/forward-to-sentence-end) (point)))
    (just-one-space 0)))

(define-key (current-global-map) [remap kill-sentence] 'my/kill-sentence-dwim)

;; My sentences have one space after a period.
(setq sentence-end-double-space nil)

;; Don't make that awful sound
(setq ring-bell-function #'ignore)

;; Turn off flycheck. Too many problems.
(global-flycheck-mode -1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                ESS mode                                ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Activate ESS
(require 'ess-site)

;; Smartparens in R repl
(add-hook 'ess-R-post-run-hook 'smartparens-mode)

;; Disable conversion of underscores to arrows; map to M-- instead
(ess-toggle-underscore nil)
(setq ess-S-assign-key (kbd "M--"))
(add-hook 'ess-mode-hook (lambda () (ess-toggle-S-assign-key t)))

;; Two space indentation
(add-to-list 'ess-style-alist
	     '(khw-R (ess-indent-level . 2)))
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

;; %>% shortcut
;; http://emacs.stackexchange.com/a/8055/7060
(defun then_R_operator ()
  "R - %>% operator or 'then' pipe operator"
  (interactive)
  (just-one-space 1)
  (insert "%>%")
  (reindent-then-newline-and-indent))
(define-key ess-mode-map (kbd "C->") 'then_R_operator)
(define-key inferior-ess-mode-map (kbd "C->") 'then_R_operator)

;; Bring up empty R script and R console for quick calculations
(defun R-scratch ()
  (interactive)
  (progn
    (delete-other-windows)
    (setq new-buf (get-buffer-create "scratch.R"))
    (switch-to-buffer new-buf)
    (R-mode)
    (setq w1 (selected-window))
    (setq w1name (buffer-name))
    (setq w2 (split-window w1 nil t))
    (if (not (member "*R*" (mapcar (function buffer-name) (buffer-list))))
        (R))
    (set-window-buffer w2 "*R*")
    (set-window-buffer w1 w1name)))

(global-set-key (kbd "C-x 9") 'R-scratch)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                            Google Translate                            ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq google-translate-translation-directions-alist '(("ru" . "en") ("en" . "ru")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                  Helm                                  ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Give me my damn tab completion
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                 Jabber                                 ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; View emoji in jabber
(add-hook 'jabber-chat-mode-hook (lambda () (emoji-cheat-sheet-plus-display-mode)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                Key-chord                               ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'prelude-key-chord)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                Key-combo                               ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                  Magit                                 ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The below will prevent me from accidentally pushing new branches to master
(setq magit-branch-arguments nil)
(setq magit-push-arguments '("--set-upstream"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                Markdown                                ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Don't strip trailing whitespace in markdown mode
(add-hook 'markdown-mode-hook
          (lambda ()
            (make-local-variable 'prelude-clean-whitespace-on-save)
            (setq-local prelude-clean-whitespace-on-save nil)))

;; Auto fill mode
(add-hook 'markdown-mode-hook
          (lambda ()
            (turn-on-auto-fill)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                  mu4e                                  ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;; Thanks @gastove :D

;;; Commentary:
;; Borrowed, gratefully, from
;; http://kirang.in/2014/11/13/emacs-as-email-client-with-offlineimap-and-mu4e-on-osx/
;;; Code:

;; If I want multiple accounts, need to manage these:
;; (setq mu4e-sent-folder "/Account1/Saved Items" ;; check
;;      mu4e-drafts-folder "/Account1/Drafts"     ;; check
;;      user-mail-address "my.address@account1.tld" ;; check
;;      smtpmail-default-smtp-server "smtp.account1.tld" ;; check
;;      smtpmail-local-domain "account1.tld"
;;      smtpmail-smtp-server "smtp.account1.tld" ;; check
;;      smtpmail-stream-type starttls
;;      smtpmail-smtp-service 25)

;; Re-enable C-x m for email (nerfs eshell, which I never use)
(global-set-key (kbd "C-x m") 'compose-mail)

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(setq mu4e-maildir "~/.mail")
(setq mu4e-drafts-folder "/woo.kara@gmail.com/[Gmail].Drafts")
(setq mu4e-sent-folder   "/woo.kara@gmail.com/[Gmail].Sent Mail")
;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)
;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; Make mu4e the default user agent
(setq mail-user-agent 'mu4e-user-agent)

;; mu4e mail dirs
(require 'mu4e-maildirs-extension)
(mu4e-maildirs-extension)

;; shortcuts
(setq mu4e-maildir-shortcuts
      '(("/woo.kara@gmail.com/INBOX"               . ?i)
        ("/woo.kara@gmail.com/[Gmail].Important"   . ?I)
        ("/woo.kara@gmail.com/[Gmail].Sent Mail"   . ?s)))

;; something about ourselves
(setq user-mail-address "woo.kara@gmail.com"
      user-full-name  "Kara Woo")

;; ISO date format
(setq mu4e-headers-date-format "%Y-%m-%d")

;; The next two things are supposed to help show inline images in emails but
;; Ross says they don't work so much
;; show images
(setq mu4e-show-images t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; convert html emails properly
;; Possible options:
;;   - html2text -utf8 -width 72
;;   - textutil -stdin -format html -convert txt -stdout
;;   - html2markdown | grep -v '&nbsp_place_holder;' (Requires html2text pypi)
;;   - w3m -dump -cols 80 -T text/html
;;   - view in browser (provided below)
;; (setq mu4e-html2text-command "textutil -stdin -format html -convert txt -stdout")
;; (setq mu4e-html2text-command "pandoc -f html -t plain")
(require 'mu4e-contrib)
(setq mu4e-html2text-command 'mu4e-shr2text)

;; Message Composition settings: turn off auto-fill-mode
(add-hook 'mu4e-compose-mode-hook
          (lambda ()
            (auto-fill-mode -1)
            ))

;; add option to view html message in a browser
;; `aV` in view to activate
(add-to-list 'mu4e-view-actions
             '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; fetch mail every 10 mins
(setq mu4e-update-interval 600)

;; configuration for sending mail
(setq message-send-mail-function
      'sendmail-send-it
      ;; smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-smtp-user "woo.kara"
      smtpmail-mail-address "woo.kara@gmail.com"
      mail-specify-envelope-from t
      mail-envelope-from 'header
      )

;; Tweak bookmarked queries
(add-to-list 'mu4e-bookmarks `(,(string-join
                                 '("flag:unread"
                                   "AND m:/woo.kara@gmail.com/INBOX"
                                   "NOT maildir:'/woo.kara@gmail.com/github'"
                                   "NOT maildir:'/woo.kara@gmail.com/Brown'"
                                   "AND date:today..now")
                                 " ") "Today's personal Unreads" ?h))
(add-to-list 'mu4e-bookmarks `(,(string-join
                                 '("flag:unread"
                                   "AND date:today..now"
                                   "NOT maildir:'/woo@nceas.ucsb.edu/Ecolog'"
                                   "NOT maildir:'/woo@nceas.ucsb.edu/Redmine'"
                                   "AND m:/woo@nceas.ucsb.edu/INBOX")
                                 " ")
                               "Today's work unreads" ?i))
(add-to-list 'mu4e-bookmarks `(,(string-join
                                 '("flag:unread"
                                   "AND m:/woo.kara@gmail.com/INBOX"
                                   "AND date:today..now"
                                   "OR flag:unread"
                                   "AND m:/woo@nceas.ucsb.edu/INBOX"
                                   "AND date:today..now")
                                 " ") "Today's Unreads" ?u))

;; Switch accounts

(defvar my-mu4e-account-alist
  '(("woo.kara@gmail.com"
     (mu4e-drafts-folder "/woo.kara@gmail.com/[Gmail].Drafts")
     (mu4e-sent-folder   "/woo.kara@gmail.com/[Gmail].Sent Mail")
     (smtpmail-mail-address "woo.kara@gmail.com")
     (user-mail-address "woo.kara@gmail.com")
     (smtpmail-smtp-user "woo.kara"))
    ("woo@nceas.ucsb.edu"
     (mu4e-drafts-folder "/woo@nceas.ucsb.edu/[Gmail].Drafts")
     (mu4e-sent-folder   "/woo@nceas.ucsb.edu/[Gmail].Sent Mail")
     (smtpmail-mail-address "woo@nceas.ucsb.edu")
     (user-mail-address "woo@nceas.ucsb.edu")
     (smtpmail-smtp-user "woo@nceas.ucsb.edu"))))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                Org mode                                ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

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

;; Export options
(setq org-export-backends
      `(deck
        gfm
        html
        md
        pandoc))

(require 'ox-latex)

;; Export from org using XeLaTeX
;; From http://lists.gnu.org/archive/html/emacs-orgmode/2013-05/msg00975.html
;; remove "inputenc" from default packages as it clashes with xelatex
(setf org-latex-default-packages-alist
      (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))
(add-to-list 'org-latex-packages-alist '("" "xltxtra" t))
;; org to latex customisations, -shell-escape needed for minted
(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Function to export markdown, LaTeX, and PDF simultaneously
(defun org-export-mtp ()
  (interactive)
  (org-pandoc-export-to-markdown_github)
  (org-latex-export-to-pdf))

;; Collapse emphasis marks in org mode
(setq org-hide-emphasis-markers t)

;; Org header for non .org files that I want to open in org mode
(defun insert-org-header ()
  (interactive)
  (save-excursion
    (goto-line 1)
    (end-of-line)
    (insert " -*- mode: org -*-")))

;; CV stuff
(add-to-list 'org-latex-classes
             '("cv"
               "\\documentclass{cv}
               [NO-DEFAULT-PACKAGES]
               [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; Export quotes using \enquote{}
(add-to-list 'org-export-smart-quotes-alist 
             '("am"
               (opening-double-quote :utf-8 "“" :html "&ldquo;" :latex "\\enquote{" :texinfo "``")
               (closing-double-quote :utf-8 "”" :html "&rdquo;" :latex "}" :texinfo "''")
               (opening-single-quote :utf-8 "‘" :html "&lsquo;" :latex "\\enquote*{" :texinfo "`")
               (closing-single-quote :utf-8 "’" :html "&rsquo;" :latex "}" :texinfo "'")
               (apostrophe :utf-8 "’" :html "&rsquo;")))

(setq org-export-allow-bind-keywords t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                Polymode                                ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'poly-R)
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                Yasnippet                               ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(yas-global-mode t)


;;; ----------------------------------------------------------------------------

(provide 'custom)

;;; custom.el ends here
