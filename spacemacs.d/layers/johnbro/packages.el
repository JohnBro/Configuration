;;; packages.el --- johnbro layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <JohnBro@DESKTOP-I2PDVGG>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `johnbro-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `johnbro/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `johnbro/pre-init-PACKAGE' and/or
;;   `johnbro/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst johnbro-packages
  '(youdao-dictionary
    lsp-mode
    lsp-ui
    company-lsp
    ccls
    ))

(defun johnbro/init-youdao-dictionary()
  (use-package youdao-dictionary
    :defer t
    :config
    (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+))
  )

(defun johnbro/init-lsp-mode()
  (use-package lsp-mode
    :ensure t
    :defer t
    :commands lsp
    )
  )

(defun johnbro/init-lsp-ui()
  (use-package lsp-ui
    :ensure t
    :defer t
    :config
    (add-hook 'lsp-mode-hook 'lsp-ui-mode))
  )

(defun johnbro/init-company-lsp()
  (use-package company-lsp
    :ensure t
    :defer t
    :commands company-lsp
    :config
    (setq company-quickhelp-delay 0)
    ;; Language servers have better idea filtering and sorting,
    ;; don't filter results on the client side.
    (setq company-transformers nil
          company-lsp-async t
          company-lsp-cache-candidates nil))
  )

(defun johnbro/init-ccls()
  (use-package ccls
    :hook ((c-mode c++-mode objc-mode) .
           (lambda ()
             (cl-pushnew #'company-lsp company-backends)
             (require 'ccls) (lsp)))
    :init
    (setq ccls-executable "/usr/local/bin/ccls")
    (setq ccls-args '("--log-file=/tmp/ccls.log"))
    (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
    :config
    (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
    (spacemacs/set-leader-keys-for-major-mode 'c-mode "la" 'xref-find-apropos)
    (spacemacs/set-leader-keys-for-major-mode 'c-mode "ld" 'xref-find-definitions)
    (spacemacs/set-leader-keys-for-major-mode 'c-mode "lD" 'xref-find-definitions-other-window)
    (spacemacs/set-leader-keys-for-major-mode 'c-mode "ll" 'lsp-find-definition)
    (spacemacs/set-leader-keys-for-major-mode 'c-mode "lr" 'lsp-find-references)
    (spacemacs/set-leader-keys-for-major-mode 'c-mode "ls" 'lsp-ui-find-workspace-symbol)
    (spacemacs/set-leader-keys-for-major-mode 'c-mode "lt" 'lsp-find-type-definition)
    (spacemacs/set-leader-keys-for-major-mode 'c-mode "lp" 'lsp-ui-find-workspace-symbol)
    )
  )

;;; packages.el ends here
