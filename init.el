;;; Master configuration file

;;; No GUI

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; Auto-Generated
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(show-paren-mode 1) ;;Show paren matching 

;;; Taken from Starter-kit
;;Emacs load path
(let* ((my-lisp-dir "~/.emacs.d/")
       (default-directory my-lisp-dir)
       (orig-load-path load-path))
  (setq load-path (cons my-lisp-dir nil))
  (normal-top-level-add-subdirs-to-load-path)
  (nconc load-path orig-load-path))

;; Load path etc.

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;;My files
(add-to-list 'load-path (concat dotfiles-dir "/plugins"))
(add-to-list 'load-path (concat dotfiles-dir "/configurations"))

;;; ELPA 
(require 'package)
(package-initialize)

;;; Packages
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))

;;; color-theme
(color-theme-zenburn)

;; Require my customizations
(require 'kk-customizations)
