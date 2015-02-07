(when (eq window-system 'ns)
  (progn (exec-path-from-shell-initialize)
         (exec-path-from-shell-copy-env "GOPATH")))


(provide 'init-exec-path-from-shell)
