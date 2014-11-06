(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1989847d22966b1403bab8c674354b4a2adf6e03e0ffebe097a6bd8a32be1e19" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "dark slate gray")))))

(prelude-require-packages '(twittering-mode
                           sublime-themes
                           ess
                           org
                           floobits
                           color-theme-solarized))

;; Remap meta and super on Mac
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Load solarized dark theme
(load-theme 'solarized-dark t)

;; Fill paragraphs at 80 characters
(setq-default fill-column 80)

;;;;;;;;;; ESS
;; Activate ESS
(require 'ess-site)

;; Smartparens in R repl
(add-hook 'ess-R-post-run-hook 'smartparens-mode)

;; Disable conversion of underscores to arrows; map to M-- instead
(add-hook 'ess-mode-hook (lambda () (ess-toggle-underscore nil)))
(setq ess-S-assign-key (kbd "M--"))
(add-hook 'ess-mode-hook (lambda () (ess-toggle-S-assign-key t)))

;; Do the same in R repl
(add-hook 'ess-R-post-run-hook (lambda () (ess-toggle-underscore nil)))
(setq ess-S-assign-key (kbd "M--"))
(add-hook 'ess-R-post-run-hook (lambda () (ess-toggle-S-assign-key t)))


;;;;;;;;;; Helm
;; Give me my damn tab completion
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)


;;;;;;;;;; Org
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


;;;;;;;;;; Polymode
(require 'polymode)
(require 'poly-R)
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))



(provide 'custom)


;;; custom.el ends here
