(require 'erc)
(require 'erc-notify)
(require 'erc-spelling)
(require 'erc-log)

;; auto-join list 
(setq erc-autojoin-channel-list '(
                                  ("irc.qotdinc.com" "#dev")))
;; logging
(setq erc-log-channels-directory "~/.erc/logs/")
(setq erc-save-buffer-on-part nil
      erc-save-queries-on-quit nil
      erc-log-write-after-send t
      erc-log-write-after-insert t)

; Color code different buddies
(setq erc-keywords '((".*Online.*" (:foreground "green"))
                     (".*Busy" (:foreground "red"))
                     (".*Away" (:foreground "red"))
                     (".*Idle" (:foreground "orange"))
                     ))

(provide 'erc-mode-config)

