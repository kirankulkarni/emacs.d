(require 'mediawiki)

(add-to-list 'mediawiki-site-alist '("Helpshift"
                                     "http://wiki.qotdinc.com/"
                                     ""
                                     ""
                                     "Main Page"))

(setq mediawiki-site-default "Helpshift")

(provide 'mediawiki-config)
