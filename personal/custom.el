(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(fci-rule-color "#073642")
 '(flycheck-lintr-linters
   " default_linters[-which(names(default_linters) %in%
c(\"object_camel_case_linter\", \"trailing_blank_lines_linter\"))]")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(jabber-resource-line-format "     %r - %s")
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files
   (quote
    ("~/todo.org" "~/school/uw/todo.org" "~/work/dssg/todo.org")))
 '(package-selected-packages
   (quote
    (sql-indent 2048-game zop-to-char zenburn-theme yaml-mode world-time-mode which-key wgrep volatile-highlights vkill undo-tree twittering-mode sublime-themes solarized-theme smex smartrep smartparens smart-mode-line slime scss-mode rainbow-mode rainbow-delimiters pyenv-mode polymode ox-pandoc ox-gfm ov org-ref operate-on-number mu4e-maildirs-extension move-text markdown-mode magit latex-preview-pane key-combo json-rpc json-mode js2-mode jabber imenu-anywhere ido-ubiquitous helm-projectile helm-descbinds helm-ag guru-mode grizzl google-translate god-mode gitignore-mode gitconfig-mode git-timemachine gist geiser flycheck flx-ido floobits expand-region exec-path-from-shell ess emoji-cheat-sheet-plus elpy elisp-slime-nav ein easy-kill discover-my-major diminish diff-hl csv-mode crux company-auctex company-anaconda cdlatex browse-kill-ring beacon anzu ag ack-and-a-half ace-window ace-jump-mode ace-jump-buffer)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :font "Input-14")))))

;; Package repositories
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(prelude-require-packages '(color-theme-sanityinc-tomorrow
                            ein
                            emoji-cheat-sheet-plus
                            elpy
                            ess
                            floobits
                            jabber
                            key-combo
                            markdown-mode
                            org
                            org-ref
                            ox-gfm
                            ox-pandoc
                            polymode
                            projectile
                            pyvenv
                            twittering-mode
                            wgrep))

;; Start up in fullscreen
(add-to-list 'default-frame-alist '(fullscreen . fullscreen))

;; Load flip-tables (╯°□°）╯︵ ┻━━┻  & shrug ¯\_(ツ)_/¯
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

;; Function to insert new code chunk in R Markdown
;; http://emacs.stackexchange.com/a/27419/7060
(defun new-chunk (header) 
  "Insert an r-chunk in markdown mode. Necessary due to interactions between polymode and yasnippet" 
  (interactive "sHeader: ") 
  (insert (concat "```{r " header "}\n\n```")) 
  (forward-line -1))

;; My sentences have one space after a period.
(setq sentence-end-double-space nil)

;; Don't make that awful sound
(setq ring-bell-function #'ignore)

;; Turn off flycheck. Too many problems.
(global-flycheck-mode -1)

;; Timezones
(setq display-time-world-list
      '(("America/Los_Angeles" "Pacific")
        ("America/New_York" "Eastern")
        ("Asia/Irkutsk" "Irkutsk")))

;; Smoother scrolling
;; http://www.emacswiki.org/emacs/SmoothScrolling
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Remove scroll bars
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))


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

;; Bind M-enter to ess-eval-region-or-line-and-step
(define-key ess-mode-map (kbd "M-<return>") 'ess-eval-region-or-line-and-step)

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
;;;;                                Markdown                                ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Don't strip trailing whitespace in markdown mode
(add-hook 'markdown-mode-hook
          (lambda ()
            (make-local-variable 'prelude-clean-whitespace-on-save)
            (setq-local prelude-clean-whitespace-on-save nil)))


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
                                   "NOT maildir:'/woo.kara@gmail.com/Lists'"
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
                                 " ") "Today's Unreads" ?g))

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

;; Don't show messages in duplicate
(setq mu4e-headers-skip-duplicates t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                Org mode                                ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'org)

;; Disable whitespace mode in org mode
(add-hook 'org-mode-hook (lambda () (whitespace-mode -1)))

;; Visual line mode
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

;; Disable folding on startup in org
(setq org-startup-folded nil)

;; Start indented in org
(setq org-startup-indented t)

;; Set TODO keyword options
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "CLOSED")))

;; Add smartparens
(smartparens-global-mode t)
(sp-local-pair 'org-mode "~" "~")
(sp-local-pair 'org-mode "/" "/")
(sp-local-pair 'org-mode "*" "*")

;; Allow double quote at the end of a verbatim or code segment
(setcar (nthcdr 2 org-emphasis-regexp-components) " \t\r\n,")
(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)

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
        "bibtex %b"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Minted for syntax highlighting
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

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

;; Export quotes using \enquote{}
(add-to-list 'org-export-smart-quotes-alist 
             '("am"
               (opening-double-quote :utf-8 "“" :html "&ldquo;" :latex "\\enquote{" :texinfo "``")
               (closing-double-quote :utf-8 "”" :html "&rdquo;" :latex "}" :texinfo "''")
               (opening-single-quote :utf-8 "‘" :html "&lsquo;" :latex "\\enquote*{" :texinfo "`")
               (closing-single-quote :utf-8 "’" :html "&rsquo;" :latex "}" :texinfo "'")
               (apostrophe :utf-8 "’" :html "&rsquo;")))

(setq org-export-with-smart-quotes t)

(setq org-export-allow-bind-keywords t)

;; Place captions below tables
(setq org-latex-caption-above nil)

;; Additional LaTeX classes:

;; CV
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

;; Add hw class to org-latex-classes
(add-to-list 'org-latex-classes
             '("hw"
               "\\documentclass{hw}
               [NO-DEFAULT-PACKAGES]
               [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; SIGCHI template
(add-to-list 'org-latex-classes
             '("sigchi"
               "\\documentclass{sigchi}
               [NO-DEFAULT-PACKAGES]
               [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; letter class
(add-to-list 'org-latex-classes
             '("letter"
               "\\documentclass{letter}
               [NO-DEFAULT-PACKAGES]
               [EXTRA]"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                Org-babel                               ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (lisp . t)
   (python . t)
   (R . t)
   (shell . t)))

;; Quit asking if I want to evaluate the source blocks, I do
(setq org-confirm-babel-evaluate nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                 Org-ref                                ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set default bibliography
(setq reftex-default-bibliography '("~/references.bib"))

;; Set default bibliography for helm
(setq helm-bibtex-bibliography "~/references.bib")

;; Use citep by default (instead of cite)
;; (setq org-ref-default-citation-link "citep")

(require 'org-ref)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                Polymode                                ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'poly-R)
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;; Export files with the same name as the main file
(setq polymode-exporter-output-file-format "%s")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                       Python, Elpy, Pyvenv, EIN                        ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use Elpy
(package-initialize)
(elpy-enable)

;; Use IPython interpreter
(elpy-use-ipython)

;; Use my anaconda environments for pyvenv
(setenv "WORKON_HOME" "/Users/Kara/anaconda/envs")
(pyvenv-mode 1)

;; Use Django-style docstrings
(setq python-fill-docstring-style 'django)

;; Imitate ess-eval-region-or-line-and-step behavior in Python
(defun py-eval-region-or-line-and-step ()
  (interactive)
  (if (and transient-mark-mode mark-active
           (> (region-end) (region-beginning)))
      (elpy-shell-send-region-or-buffer)
    (progn
      (end-of-line)
      (let ((eol (point)))
        (beginning-of-line)
        (python-shell-send-region (point) eol))
      (python-nav-forward-statement)
      )))

;; Map py-eval-region-or-line-and-step to M-ret because that's how I have it set
;; for ESS
(define-key python-mode-map (kbd "M-<return>") 'py-eval-region-or-line-and-step)

;; In EIN mode, M-return should evaluate the current cell
;; (define-key ein:notebook-mode-map (kbd "M-<return>") 'ein:worksheet-execute-cell-and-goto-next)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                 Twitter                                ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq twittering-use-master-password t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                Yasnippet                               ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(yas-global-mode t)


;;; ----------------------------------------------------------------------------

(provide 'custom)

;;; custom.el ends here
