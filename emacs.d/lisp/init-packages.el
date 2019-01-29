(require 'cl)

(when (>= emacs-major-version 24)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;;add whatever packages you want here
(defvar johnbro/packages '(
			   ;;----------- Complete  ----------------
			   company
			   monokai-theme
			   ;;------------ Better edit -------------
			   smooth-scrolling
			   hungry-delete
			   swiper
			   counsel
			   smartparens
			   ;;----------- Major mode ---------------
			   js2-mode
			   nodejs-repl
			   exec-path-from-shell
			   popwin
			   )  "Default packages")

(setq package-selected-packages johnbro/packages)

(defun johnbro/packages-installed-p ()
  (loop for pkg in johnbro/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (johnbro/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg johnbro/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)


(load-theme 'monokai t)

(require 'popwin)    ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)

(provide 'init-packages)
