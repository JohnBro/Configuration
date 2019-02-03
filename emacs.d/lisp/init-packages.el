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
			   exec-path-from-shell
			   evil
			   evil-leader
			   evil-surround
			   evil-nerd-commenter
			   which-key
			   window-numbering
			   ;;----------- Useful pkg ---------------
			   popwin
			   reveal-in-osx-finder
			   expand-region
			   iedit
			   helm-ag
			   flycheck
			   ;;----------- Code enhance ------------
			   yasnippet
			   auto-yasnippet
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

(require 'yasnippet)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(global-evil-leader-mode t)
(evil-mode 1)
(window-numbering-mode 1)
(which-key-mode 1)
(evilnc-default-hotkeys)
(require 'evil-surround)
(global-evil-surround-mode)

(evil-leader/set-leader "<SPC>")

(define-key evil-insert-state-map [escape] 'evil-normal-state)

(evil-leader/set-key
  "ff" 'counsel-find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  ";"  'evilnc-comment-or-uncomment-lines
  "wM" 'delete-other-windows
  )

(evil-normal-state)

(provide 'init-packages)
