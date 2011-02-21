;; Copied from Org-mode manual
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Suggestion: Also include global key bindings to create 
;; Inserting org-link in any emacs buffer and and open them
;; (global-set-key "\C-c L" 'org-insert-link-global)
;; (global-set-key "\C-c o" 'org-open-at-point-global)

;; Crating custom sparse trees
;; use C-c a <key> 
;; following "FIXME" is just an example.
;; customizations will be added later
(setq org-agenda-custom-commands
'(("f" occur-tree "FIXME")))

;; Modifying the Bullets while demoting
(setq org-list-demote-modify-bullet
      '(("+" . "-") ("-" . "+") ("*" . "+")))

;; Align all tables at startup
(setq org-startup-align-all-tables t)

;; Calc package is needed for making spreadsheets
(require 'calc)

;; END of org mode configuration
(provide 'org-mode-config)
