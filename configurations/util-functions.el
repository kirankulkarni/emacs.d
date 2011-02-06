;; Utility Functions

;;function to implement a smarter TAB
(defun smart-tab ()
  "This smart tab is minibuffer compliant: it acts as usual in
  the minibuffer. Else, if mark is active, indents region. Else if
  point is at the end of a symbol, expands it. Else indents the
  current line."
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete)
	(hippie-expand nil))
    (if mark-active
	(indent-region (region-beginning)
		       (region-end))
      (if (looking-at "\\_>")
	  (hippie-expand nil)
	(indent-for-tab-command)))))
(global-set-key (kbd "TAB") 'smart-tab)

;;End of the 
(provide 'util-functions)
