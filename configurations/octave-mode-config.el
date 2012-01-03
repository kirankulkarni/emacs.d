(autoload 'octave-mode "octave-mod" nil t)

(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))


(setq octave-comment-char 37)
(setq octave-comment-start "% ")
(provide 'octave-mode-config)
