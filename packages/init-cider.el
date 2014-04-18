;;; Cider Config

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t
      cider-repl-popup-stacktraces t
      nrepl-buffer-name-separator "-"
      nrepl-buffer-name-show-port t
      cider-switch-to-repl-command 'cider-switch-to-current-repl-buffer
      cider-repl-wrap-history t
      cider-repl-history-size most-positive-fixnum
      cider-repl-history-file (concat session-files-dir "/cider-history.txt"))



(provide 'init-cider)
