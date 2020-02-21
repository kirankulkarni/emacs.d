(deftheme billw
  "billw emacs24 theme")


(let ((class '((class color) (min-colors 89))))

  (custom-theme-set-faces
   'billw

   ;; Basic Coloring
   `(default ((,class (:foreground "ivory" :background "grey11"))))
   `(cursor ((,class (:background "white"))))

   ;; Highlighting
   `(fringe ((,class (:background "#303030"))))
   `(highlight ((,class (:foreground "wheat" :background "darkslategray"))))
   `(region ((,class (:background "dimgray"))))
   `(secondary-selection ((,class (:background "deepskyblue4"))))

   ;; Mode line
   `(mode-line ((,class (:foreground "grey11" :background "wheat"))))
   `(mode-line-buffer-id ((,class (:background "grey11" :foreground "wheat"))) )

   ;; Show paren
   `(show-paren-match ((,class (:background "deepskyblue4"))))
   `(show-paren-mismatch ((,class (:background "red" :foreground "white"))))

   ;; Font Locks
   `(font-lock-comment-face ((,class (:foreground "#99968b"))))
   `(font-lock-string-face ((,class (:foreground "orange2"))))
   `(font-lock-keyword-face ((,class (:foreground "cyan2"))))
   `(font-lock-builtin-face ((,class (:foreground "LightSteelBlue"))))
   `(font-lock-function-name-face ((,class (:foreground "mediumspringgreen"))))
   `(font-lock-variable-name-face ((,class (:foreground "light salmon"))))
   `(font-lock-type-face ((,class (:foreground "yellow2"))))
   `(font-lock-constant-face ((,class (:foreground "salmon"))))
   `(font-lock-warning-face ((,class (:foreground "gold" :bold t))))

   ;; Ediff
   `(ediff-current-diff-face-A ((,class (:foreground "firebrick" :background "pale green"))))
   `(ediff-current-diff-face-B ((,class (:foreground "DarkOrchid" :background "Yellow"))))
   `(ediff-current-diff-face-C ((,class (:foreground "white" :background "indianred"))))
   `(ediff-current-diff-face-Ancestor ((,class (:foreground "Black" :background "VioletRed"))))
   `(ediff-fine-diff-face-A ((,class (:foreground "Navy" :background "sky blue"))))
   `(ediff-fine-diff-face-B ((,class (:foreground "Black" :background "cyan"))))
   `(ediff-fine-diff-face-C ((,class (:foreground "Black" :background "Turquoise"))))
   `(ediff-fine-diff-face-Ancestor ((,class (:foreground "Black" :background "Green"))))
   `(ediff-even-diff-face-A ((,class (:foreground "Black" :background "light grey"))))
   `(ediff-even-diff-face-B ((,class (:foreground "White" :background "Grey"))))
   `(ediff-even-diff-face-C ((,class (:foreground "Black" :background "light grey"))))
   `(ediff-even-diff-face-Ancestor ((,class (:foreground "White" :background "Grey"))))
   `(ediff-odd-diff-face-A ((,class (:foreground "White" :background "Grey"))))
   `(ediff-odd-diff-face-B ((,class (:foreground "Black" :background "light grey"))))
   `(ediff-odd-diff-face-C ((,class (:foreground "White" :background "Grey"))))
   `(ediff-odd-diff-face-Ancestor ((,class (:foreground "Black" :background "light grey"))))

   ;; Custom faces
   `(custom-rogue-face ((,class (:foreground "pink" :background "black"))))
   `(custom-modified-face ((,class (:foreground "white" :background "blue"))))
   `(custom-set-face ((,class (:foreground "blue"))))
   `(custom-changed-face ((,class (:foreground "wheat" :background "skyblue"))))
   `(custom-saved-face ((,class (:underline t))))
   `(custom-state-face ((,class (:foreground "light green"))))
   `(custom-variable-tag-face ((,class (:foreground "skyblue" :underline t))))
   `(custom-variable-button-face ((,class (:bold t :underline t))))
   `(custom-face-tag-face ((,class (:foreground "white" :underline t))))
   `(custom-group-tag-face-1 ((,class (:foreground "pink" :underline t))))
   `(custom-group-tag-face ((,class (:foreground "skyblue" :underline t))))

   ;; LaTeX fonts
   `(font-latex-bold-face ((,class (nil))))
   `(font-latex-italic-face ((,class (nil))))
   `(font-latex-math-face ((,class (nil))))
   `(font-latex-sedate-face ((,class (:foreground "Gray85"))))
   `(font-latex-string-face ((,class (:foreground "orange"))))
   `(font-latex-warning-face ((,class (:foreground "gold"))))

   ;; Eshell
   `(eshell-ls-directory-face ((,class (:foreground "green" :bold t))))
   `(eshell-ls-symlink-face ((,class (:foreground "Cyan" :bold t))))
   `(eshell-ls-executable-face ((,class (:foreground "orange" :bold t))))
   `(eshell-ls-readonly-face ((,class (:foreground "gray"))))
   `(eshell-ls-unreadable-face ((,class (:foreground "DarkGrey"))))
   `(eshell-ls-special-face ((,class (:foreground "Magenta" :bold t))))
   `(eshell-ls-missing-face ((,class (:foreground "Red" :bold t))))
   `(eshell-ls-archive-face ((,class (:foreground "Orchid" :bold t))))
   `(eshell-ls-backup-face ((,class (:foreground "LightSalmon"))))
   `(eshell-ls-product-face ((,class (:foreground "LightSalmon"))))
   `(eshell-ls-clutter-face ((,class (:foreground "blue" :bold t))))
   ))


(provide-theme 'billw)
