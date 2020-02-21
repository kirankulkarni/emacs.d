(add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-vc-set-filter-groups-by-vc-root)
      (ibuffer-do-sort-by-alphabetic)))


(provide 'init-ibuffer-vc)
