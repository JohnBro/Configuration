;;; config.el --- Better Emacs Defaults Layer configuration variables File
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Thomas de Beauchêne <thomas.de.beauchene@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; dwim = do waht I means
(defun occur-dwim()
  "Call `occur' with a sane default"
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur)
  )

(defun johnbro/setup-indent()
  ;; java/c/c++
  (setq c-basic-offset 4)
  ;; web development
  (setq coffee-tab-width 2) ; coffeescript
  (setq javascript-indent-level 2) ; javascript-mode
  (setq js-indent-level 2) ; js-mode
  (setq js2-basic-offset 2) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2) ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2) ; web-mode, js code in html file
  (setq css-indent-offset 2) ; css-mode
  )

(johnbro/setup-indent)

(add-hook 'c-mode-hook
          '(lambda()
             (setq indent-tabs-mode nil)
             (setq c-basic-offset 4)
             (setq tab-width 4)
             (setq gtags-enable-by-default t)))

(add-hook 'c++-mode-hook
          '(lambda()
             (setq indent-tabs-mode nil)
             (setq c-basic-offset 4)
             (setq tab-width 4)
             (setq gtags-enable-by-default t)))

(add-hook 'shell-mode-hook
          '(lambda()
             (setq indent-tabs-mode nil)
             (setq tab-width 2)))
