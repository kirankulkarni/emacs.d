
(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))

(add-hook 'adoc-mode-hook (lambda() (buffer-face-mode t)))


(provide 'init-adoc-mode)
