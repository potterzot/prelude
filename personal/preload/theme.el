
;; Theme-related config

;; These functions keep the background from changing on load
(defun on-frame-open (frame)
  (if (not (display-graphic-p frame))
    (set-face-background 'default "unspecified-bg" frame)))
(on-frame-open (selected-frame))
(add-hook 'after-make-frame-functions 'on-frame-open)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

;; Smart Mode Line and theme
(setq sml/theme 'powerline)
(sml/setup)

;; Emacs theme
(setq prelude-theme 'solarized-dark)

 
