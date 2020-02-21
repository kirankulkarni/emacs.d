;;; This includes changes to Emacs default settings for my liking

;;; Disabling the GUI elements to get more screen space
(progn
  ;; Disable the menu bar
  (when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

  ;; Toolbar is definitely a distraction disable it
  (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))

  ;; Scrolling is done using key-bindings explicit scroll-bars are not needed
  (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  (when (fboundp 'horizontal-scroll-bar-mode) (horizontal-scroll-bar-mode -1)))


;;; -------------------------- setq defaults  -----------------------------------
;;; Using `setq-default` sets the value of these variables for
(setq-default
 ;; Set Fill Column to 80
 fill-column 80

 ;; Set tab-width
 tab-width 4

 ;; Disable indentation with tabs
 indent-tabs-mode nil

 ;; Add a newline at the end of file before saving it
 require-final-newline t)


;;; ----------------- Global Activation of functionalities ---------------------
;; Change all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;;; Delete trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Automatically update buffers if file content on the disk has changed.
(global-auto-revert-mode t)


;; Uniquify ensures that buffer name are unique. It uses part of the
;; file-path to ensure this uniqueness. If `Makefile` is present in
;; two directories in `tmp` and `zaphod` then with following settings
;; it will do `Makefile|tmp` and `Makefile|zaphod`
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)


;;; -------------------------- Key Bindings  -----------------------------------

;;; For mac use mac-command-modifier to map command to meta
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))

;; Attach C-+ and C-- for increasing and decreasing font
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)


;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)


;;; Use Shift+arrow-key to navigate the window instead of `C-x o`
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;; Just like adding Shift to tab switching cycles it backward setting
;;; a keybinding to traverse in reverse order
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one


;;; Allows quickly to revert from disk
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Invoke the rgrep command. Can be used for `grep` a text
(global-set-key (kbd "C-x r") 'rgrep)


;; Often you jump to start/end of the file or search and end up at
;; other location and you wish to come back. This command can be used
;; for that
(global-set-key (kbd "M-j") 'pop-to-mark-command)

(global-set-key (kbd "M-,") 'pop-tag-mark)
(global-set-key (kbd "M-*") 'tags-loop-continue)





;;; -------------------------- Locale Setup  -----------------------------------
(prefer-coding-system                   'utf-8)
(set-language-environment               'UTF-8)
(set-default-coding-systems             'utf-8)
(set-keyboard-coding-system             'utf-8)
(set-terminal-coding-system             'utf-8)
(set-clipboard-coding-system            'utf-8)
(set-selection-coding-system            'utf-8)
(setq-default
 file-name-coding-system  'utf-8
 buffer-file-coding-system 'utf-8
 coding-system-for-write 'utf-8
 default-process-coding-system '(utf-8 . utf-8)
 slime-net-coding-system 'utf-8-unix)




(provide 'my-defaults)
