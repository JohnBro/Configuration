;;; keybindings.el --- Better Emacs Defaults Layer key bindings File
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(spacemacs/set-leader-keys "oo" 'occur-dwim)

;; use jk to repleace escape
(setq-default evil-escape-key-sequence "jk")

;; use jkhl in other mode
(evil-add-hjkl-bindings package-menu-mode-map 'emacs)
(evil-add-hjkl-bindings custom-mode-map 'emacs)
(evil-add-hjkl-bindings recentf-dialog-mode-map 'emacs)

;; Evil-normal state remap, gj -> j, gk -> k.
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-line)

;; Evil-insert state remap
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
