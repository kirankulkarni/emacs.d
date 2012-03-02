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

;; ---------------
;; TODO keywords
;; ---------------

;; Org Fast tag selection
(setq org-use-fast-todo-selection t)
;; Org log note or time based on keyword action
(setq org-log-into-drawer t)
;; ! insert timestamp
;; @ Insert a note
;; / seperates entering action and leaving action of a state
(setq org-todo-keywords
      (quote ((sequence "TODO(t!/!)" "ACTIVE(a@/!)" "WAITING(w@/!)" "COMMITTED(c@/!)" "|" "DONE(d!/!)" "VERIFIED(v!/!)" "JUNKED(j@/!)"))))

;; Colorize your keywords
(setq org-todo-keyword-faces
      (quote (("TODO"      :foreground "red"          :weight bold)
              ("ACTIVE"    :foreground "orange"       :weight bold)
              ("WAITING"   :foreground "yellow"       :weight bold)
              ("COMMITTED" :foreground "lightblue"    :weight bold)
              ("VERIFIED"  :foreground "forest green" :weight bold)
              ("DONE"      :foreground "forest green" :weight bold)
              ("JUNKED"    :foreground "lightgreen"   :weight bold))))

;;; Enforcing the todo dependencies so that parent can not be marked as done
;;; until children are done
;;; for complex dependencies checkout org-depend.el
(setq org-enforce-todo-dependencies t)
(set org-enforce-todo-checkbox-dependencies t)

;; Align all tables at startup
(setq org-startup-align-all-tables t)

;; Read more about TODO habits might be useful for Agenda views later

;; ;; Priorities Will be needed for Agenda Views
;; (setq org-highest-priority)
;; (setq org-lowest-priority)
;; (setq org-default-priority)

;; If you would like a TODO entry to automatically change to DONE when all children
;; are done, you can use the following setup:
;; (defun org-summary-todo (n-done n-not-done)
;;   "Switch entry to DONE when all subentries are done, to TODO otherwise."
;;   (let (org-log-done org-log-states)
;;                                         ; turn off logging
;;     (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
;; (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)


;; ---------------
;; TAGS
;; ---------------

;; Tags List
(setq org-tag-alist '((:startgroup . nil)
                      ("work" . ?w)
                      ("personal" . ?p)
                      (:endgroup . nil)))

;;; If you find that most of the time you need only a single key press to
;;; modify your list of tags: uncomment the following command
;; (setq org-fast-tag-selection-single-key t)


;; ---------------
;; PROPERTIES
;; ---------------
;;; global properties copied inspired by Bernt Hansen
(setq org-global-properties
      (quote (("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00 0:00")
              ("STYLE_ALL" . "habit")))
      org-columns-default-format
      "%80ITEM(Task) %Effort(Effort){:} %CLOCKSUM")


;; Calc package is needed for making spreadsheets
(require 'calc)

;; I don't want org mode to export a_b as a subscript b in latex.
;; I mostly write code documents and this is never the intended behavior
;; Copied from Vedang Manerikar's configuration
(setq org-export-with-sub-superscripts nil)
;; Copied from Vedang Manerikar
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
;; allow for export=>beamer by placing #+LaTeX_CLASS: beamer in org files
(add-to-list 'org-export-latex-classes
             ;; beamer class, for presentations
             '("beamer"
               "\\documentclass[11pt]{beamer}\n
      \\mode<{{{beamermode}}}>\n
      \\usetheme{{{{beamertheme}}}}\n
      \\usecolortheme{{{{beamercolortheme}}}}\n
      \\beamertemplateballitem\n
      \\setbeameroption{show notes}
      \\usepackage{color}
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
      \\usepackage{verbatim}\n
      \\institute{{{{beamerinstitute}}}}\n
       \\subject{{{{beamersubject}}}}\n"

               ("\\section{%s}" . "\\section*{%s}")

               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}")))

;; letter class, for formal letters
(add-to-list 'org-export-latex-classes

             '("letter"
               "\\documentclass[11pt]{letter}\n
      \\usepackage{color}\n
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
      \\usepackage{verbatim}\n"

               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; article class, for articles
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass[10pt]{article}
\\usepackage{color}
\\usepackage{listings}
\\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
\\usepackage{verbatim}\n
\\usepackage[left=1in,top=1in,right=1in,bottom=1in,head=0.2in,foot=0.2in]{geometry}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))



;; END of org mode configuration
(provide 'org-mode-config)
