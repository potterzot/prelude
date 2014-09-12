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
 )

(prelude-require-packages '(twittering-mode
                           sublime-themes
                           ess
                           org
                           color-theme-solarized))

;; Disable whitespace mode in org mode
(add-hook 'org-mode-hook (lambda () (whitespace-mode -1)))

;; Add smartparens
(smartparens-global-mode t) 
(sp-local-pair 'org-mode "~" "~")
(sp-local-pair 'org-mode "/" "/")
(sp-local-pair 'org-mode "*" "*")

;; Collapse emphasis marks in org mode
(setq org-hide-emphasis-markers t)

;; Load solarized dark theme
(load-theme 'solarized-dark t)

;; Activate ESS 
(require 'ess-site)


(provide 'custom)


;;; custom.el ends here
