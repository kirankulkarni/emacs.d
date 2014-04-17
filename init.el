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
 '(display-time-mode nil)
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Anonymous Pro" :foundry "unknown" :slant normal :weight normal :height 130 :width normal)))))

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

(setq dotfiles-etc-dir (concat dotfiles-dir "etc/"))

;;My files
(add-to-list 'load-path (concat dotfiles-dir "/plugins"))
(add-to-list 'load-path (concat dotfiles-dir "/configurations"))
(setq session-files-dir (concat dotfiles-dir "session-files/"))

;;; Add /usr/local/bin in PATH
(add-to-list 'exec-path "/usr/local/bin")

;; Common libraries
(require 'uniquify)

;;; ELPA
(require 'package)
(package-initialize)

;;; Packages
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))


;;; color-theme
(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/plugins/themes"))
(load-theme 'billw t)

;; Require my customizations
(require 'kk-customizations)

;;; Start emacs server if it is not running
(load "server")
(unless (server-running-p)
  (server-start))
