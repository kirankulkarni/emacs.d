;;; Master configuration file


;;; ------------------------- Load Path files ----------------------------------

;;; Creating this new var to capture the emacs dot directory
(setq-default dotfiles-dir (file-name-directory
                            (or (buffer-file-name) load-file-name)))




(setq-default dotfiles-etc-dir (concat dotfiles-dir "etc/"))

;;Add My directrories in load path
(add-to-list 'load-path (concat dotfiles-dir "/plugins"))
(add-to-list 'load-path (concat dotfiles-dir "/configurations"))


;;; ------------------ Load the customs : fonts etc ---------------------------
(setq-default custom-file (concat dotfiles-dir "custom.el"))
(load-file custom-file)

;;; ------------------ Set defaults as per my liking ---------------------------
(require 'my-defaults)


;;; ------------------------ Setting up session --------------------------------
(setq-default session-files-dir (concat dotfiles-dir "session-files/"))


;;; ELPA
(require 'package)
(package-initialize)

;;; Packages
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))


;;; ----------------- Enable old customizations file ---------------------------
;; Require my customizations
(require 'kk-customizations)

;;; -------------- Load el-get initializing all packages -----------------------
(load-file (concat dotfiles-dir "init-el-get.el"))
(require 'init-el-get)


;;; ------------------------ Load and enable theme -----------------------------
;;; My color-theme
(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/plugins/themes"))
;;; load theme
(load-theme 'zenburn t)


;;; Start emacs server if it is not running
(load "server")
(unless (server-running-p)
  (server-start))
