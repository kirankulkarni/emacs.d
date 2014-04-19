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
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#1d1f21"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes (quote ("90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "7d4d00a2c2a4bba551fcab9bfd9186abe5bfa986080947c2b99ef0b4081cb2a6" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "54e312857acc912122baa9dd49712fb99c690c72a1236cffbcc6831aa9128965" "c06241fdef16c336d0cc3a96cf5de5725fad678e9313513e586f0a243289ada5" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(display-time-mode nil)
 '(fci-rule-color "#282a2e")
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#cc6666") (40 . "#de935f") (60 . "#f0c674") (80 . "#b5bd68") (100 . "#8abeb7") (120 . "#81a2be") (140 . "#b294bb") (160 . "#cc6666") (180 . "#de935f") (200 . "#f0c674") (220 . "#b5bd68") (240 . "#8abeb7") (260 . "#81a2be") (280 . "#b294bb") (300 . "#cc6666") (320 . "#de935f") (340 . "#f0c674") (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))
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


;;; My color-theme
(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/plugins/themes"))

(require 'init-el-get)

;;; load theme
(load-theme 'zenburn t)

;; Require my customizations
(require 'kk-customizations)

;;; Start emacs server if it is not running
(load "server")
(unless (server-running-p)
  (server-start))
