(setq user-full-name "Melanich Hennadii"
      user-mail-address "mhennadii@knu.ua")
;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq org-directory "~/.org")
;(setq org-roam-directory "~/.org/roam")

(setq display-line-numbers-type 'visual)
(setq default-input-method 'russian-computer) ; C-\ switch to completely russian support

(defun rag-set-face (frame)
  "Configure faces on frame creation"
  (select-frame frame)
  (if (display-graphic-p)
      (progn
        (when (member "Iosevka" (font-family-list))
          (progn
            (set-frame-font "Iosevka-15" nil t))))))
(add-hook 'after-make-frame-functions #'rag-set-face)
;; set frame font when running emacs normally
(when (member "Iosevka" (font-family-list))
  (progn
    (set-frame-font "Iosevka-15" nil t)))


(setq doom-theme 'doom-nord)


(custom-set-variables
 '(ansi-color-names-vector
   ["#272C36" "#BF616A" "#A3BE8C" "#EBCB8B" "#81A1C1" "#B48EAD" "#88C0D0" "#ECEFF4"])
 '(custom-safe-themes
   (quote
    ("e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "fe94e2e42ccaa9714dd0f83a5aa1efeef819e22c5774115a9984293af609fce7" default)))
 '(display-line-numbers nil)
 '(fci-rule-color "#4C566A")
 '(jdee-db-active-breakpoint-face-colors (cons "#191C25" "#81A1C1"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#191C25" "#A3BE8C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#191C25" "#434C5E"))
 '(objed-cursor-color "#BF616A")
 '(org-agenda-files
   (quote
    ("~/.org/roam/20200816100807-agenda.org")))
 '(org-log-into-drawer t)
 '(package-selected-packages (quote (reverse-im linum-relative use-package)))
 '(pdf-view-midnight-colors (cons "#ECEFF4" "#2E3440"))
 '(rustic-ansi-faces
   ["#2E3440" "#BF616A" "#A3BE8C" "#EBCB8B" "#81A1C1" "#B48EAD" "#88C0D0" "#ECEFF4"])
 '(vc-annotate-background "#2E3440")
 '(vc-annotate-color-map
   (list
    (cons 20 "#A3BE8C")
    (cons 40 "#bbc28b")
    (cons 60 "#d3c68b")
    (cons 80 "#EBCB8B")
    (cons 100 "#e2b482")
    (cons 120 "#d99d79")
    (cons 140 "#D08770")
    (cons 160 "#c68984")
    (cons 180 "#bd8b98")
    (cons 200 "#B48EAD")
    (cons 220 "#b77f96")
    (cons 240 "#bb7080")
    (cons 260 "#BF616A")
    (cons 280 "#a05b67")
    (cons 300 "#815664")
    (cons 320 "#625161")
    (cons 340 "#4C566A")
    (cons 360 "#4C566A")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 '(org-level-1 ((t (:inherit bold :foreground "#ECEFF4" :height 1.13))))
 '(org-level-2 ((t (:inherit bold :foreground "#ECEFF4" :height 1.10))))
 '(org-level-3 ((t (:inherit bold :foreground "#ECEFF4" :height 1.08))))
 '(org-level-4 ((t (:inherit bold :foreground "#ECEFF4" :height 1.08))))
 '(org-level-5 ((t (:inherit bold :foreground "#ECEFF4" :height 1.08))))
 '(org-level-6 ((t (:inherit bold :foreground "#ECEFF4" :height 1.08))))
 '(org-level-7 ((t (:inherit bold :foreground "#ECEFF4" :height 1.08))))
 '(org-level-8 ((t (:inherit bold :foreground "#ECEFF4" :height 1.08))))
 '(org-document-title ((t (:inherit bold :foreground "#ECEFF4" :height 1.25))))
 )

(add-hook 'after-init-hook 'org-roam-server-mode)
;(setq undo-fu-mode 'nil)

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c s") 'org-roam-server-mode)
(global-set-key (kbd "C-c u") (kbd "gg C-c C-c C-c C-v t")) ; test, if no lags appears
;(global-set-key (kbd "C-c e") '(org-roam-mode org-roam))

(setq org-cycle-separator-lines 2)
(setq calendar-week-start-day 1) ; start week from Monday
(setq org-hide-emphasis-markers t) ; org-mode conceall markup
;(setq org-startup-folded t) ; fold everything on startup

; reduce amount of garbage

(after! org
                                        ; for presentations
 (add-to-list 'org-latex-packages-alist
              '("AUTO" "babel" t ("pdflatex")))
 (add-to-list 'org-latex-packages-alist
              '("AUTO" "polyglossia" t ("xelatex" "lualatex")))
 )

(after! org
  (setq org-capture-templates
        '(
          ;("u" "thoughts for upgrading") ;check the documentation
          ("r" "30 min review" item ;check the documentation
           (file+olp+datetree "~/.org/roam/20200816081408-2_min_diary.org" ) ;file and heading
           "%U\n- [ ] %?\n- это было здорово:\n\t- .\n- можно еще круче:\n   \t- .   \n") ; :tree-type year (or day) change nothing, :tree-type week also almosed nothing

          ;("h" "hierarchy of issues (level up)" item ; одновременно это более подробный отчет о проделанной работе
          ; (file+olp+datetree "~/.org/3.efficiency/hierarchy-of-issues.org" ) ;file and heading
          ; "%U\n - [ ] %?") ; :tree-type year (or day) change nothing, :tree-type week also almosed nothing

          ("i" "ideas" entry ;check the documentation
           (file "~/.org/roam/20200816090801-ideas.org") ;file and heading
           "* IDEA %?\n:LOGBOOK:\n\n:END:\n")

          ("a" "answers needed!") ;check the documentation
          ("ag" "answer to Gleb" entry ;check the documentation
           (file "~/.org/roam/20200816090801-ideas.org") ;file and heading
           "* ANS! =ГЛЕБ= %?\n:LOGBOOK:\n\n:END:\n")

          ("ao" "answers to other people, sources" entry ;check the documentation
           (file "~/.org/roam/20200816090801-ideas.org") ;file and heading
           "* ANS! %?\n:LOGBOOK:\n\n:END:\n")

          ("c" "conclusions" entry ;check the documentation
           (file "~/.org/roam/20200816090801-ideas.org") ;file and heading
           "* %?\n:LOGBOOK:\n\n:END:\n") ; :tree-type year (or day) change nothing, :tree-type week also almosed nothing

          ("t" "todo" entry ;check the documentation
           (file "~/.org/roam/20200816090801-ideas.org") ;file and heading
           "* TODO %?\n:LOGBOOK:\n\n:END:\n")

          ("p" "important big idea = progect" entry ;check the documentation
           (file "~/.org/roam/20200816093423-goals.org") ;file and heading
           "* PROJ %?\n:LOGBOOK:\n\n:END:\n")
          ))
)

(after! org
  (setq org-todo-keywords
        '(
          (sequence "TODO(t)" "PROJ(p@)" "BEGIN(b@)" "MIDD(m@)" "END(e@)" "|" "KILL(k)" "DONE(d)")
          (sequence  "ANS!(a@)" "*(*)" "IDEA(i@)" "LATER(l)" "|" "KILL(k)" )
          (sequence  "BIRTHDAY(B)" "|" "CONGRATULATED(C)" "FORGOT(F)")
          ;(sequence "NOW!(n@)" "|" "KILL(k)" "DONE(d)" ) ; use A priority instead
          ;(sequence  "TECH(T)" "HEALTH(H)" "EARN(E)" "|") ; use tags instead
          ))

                                        ; todo faces
  (setq org-todo-keyword-faces
        '(
          ("BIRTHDAY" . "#BF616A")
          ("TODO" . org-warning)
          ("*" . org-done)
          ("LATER" . org-done)
          ;("NOW!" . "#BF616A")
          ;("HEALTH" . "#81A1C1")
          ;("EARN" . "#81A1C1")
          ;("NOW!" . org-warning) ("STARTED" . "red")
          ;("CANCELED" . (:foreground "blue" :weight bold))
          ))
)

(after! org
(use-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("●" "●" "●"))) ;only 3 available (4-th priority not abailable)

(setq org-priority-faces '(
                           (65 :foreground "#BF616A")
                           (66 :foreground "#EBCB8B")
                           (67 :foreground "#81A1C1")
                           ;(68 :foreground grey) no 4-th priority available
                           ))
  ; put it inside "after" for test
(use-package! org-bullets
  :after org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(setq  org-bullets-bullet-list '("⁖"))

)

          ;("d" "Demo template" entry ;check the documentation
          ; (file+headline "~/.org/3.efficiency/hierarchy-of-issues.org" "Diary") ;file and heading
          ; "* DEMO TEXT %?")

          ;("p" "Prompt us for input" entry ;check the documentation
          ; (file+headline "~/.org/3.efficiency/hierarchy-of-issues.org" "Diary") ;file and heading
          ; "* %^{Write here:} %?")

          ;("o" "Select your option" entry ;check the documentation
          ; (file+headline "~/.org/3.efficiency/hierarchy-of-issues.org" "Diary") ;file and heading
          ; "* %^{Select option|one|two|three} %?")

          ;("f" "template with date stamp" entry ;check the documentation
          ; (file+headline "~/.org/3.efficiency/hierarchy-of-issues.org" "Diary") ;file and heading
          ; "* %^{Select option|one|two|three}\n SCHEDULED: %t\n %?")

          ;("t" "time based templates") ;check the documentation
          ;("tc" "current time template" entry ;check the documentation
          ; (file+headline "~/.org/3.efficiency/hierarchy-of-issues.org" "Diary") ;file and heading
          ; "* %^{Select option|one|two|three}\n SCHEDULED: %^t\n %?")

          ;("ts" "template with date and selected area" entry ;check the documentation
          ; (file+headline "~/.org/3.efficiency/hierarchy-of-issues.org" "Diary") ;file and heading
          ; "* %^{Select option|one|two|three}\n SCHEDULED: %^t\n %i\n %?")

(use-package! org-roam
;  :commands (org-roam-insert org-roam-find-file org-roam-switch-to-buffer org-roam)
  :hook
 ; (after-init . org-roam-mode)
(add-hook 'after-init-hook 'org-roam-mode)
  :init
  (map!
   :prefix "C-c"
   :desc "org-roam-mode-enable" "e" #'org-roam-mode
   :desc "org-roam" "r" #'org-roam
   :desc "org-roam-find-file" "f" #'org-roam-find-file
   :desc "org-roam-add-info-to-existing-note" "a" #'org-roam-capture
   ;:desc "org-roam-insert-info-in-file" "i" #'org-roam-insert ; don't use it, use templates, they add info quicker
   :desc "org-roam-new-tag(file)" "n" #'org-roam-insert-immediate ; don't go to tag, just tag, don't go to file, don't write content
   :desc "org-roam-show-graph" "g" #'org-roam-show-graph
   :desc "org-roam-switch-to-buffer" "v" #'org-roam-switch-to-buffer)


  (setq ;org-roam-db-gc-threshold gc-cons-threshold
        org-roam-db-gc-threshold most-positive-fixnum
        org-roam-title-sources '((title headline) alias)
        org-roam-tag-sources '(prop)
        org-roam-directory (file-truename "~/.org/roam/")
        org-roam-db-location "/home/prodper/org-roam.db")
;        org-roam-db-location "~/.org/roam/org-roam.db")
  ;(setq org-roam-tag-sources '(directories global-prop))

  (setq org-roam-capture-templates '(
                                     ;("g" "gear note for this mechanism" plain (function org-roam--capture-get-point)
                                     ; :file-name "${slug}"
                                     ; :head "#+title: ${title}    \n#+roam_alias:   \n#+roam_tags: %?    \n\ng:   \n%a    \n\n\n- [ ] TODO:   \n\t- [ ]"
                                     ; :unnarrowed t)

                                     ;("s" "simple note" plain (function org-roam--capture-get-point)
                                     ; :file-name "${slug}"
                                     ; :head "#+title: ${title}    \n#+roam_alias:   \n#+roam_tags: %?    \n\ng:   \n\n\n- [ ] TODO:   \n\t- [ ]"
                                     ; :unnarrowed t)

                                     ;("e" "file explanation and additional info" plain (function org-roam--capture-get-point)
                                     ; :file-name "${slug}"
                                     ; :head "#+title: ${title}    \n#+roam_alias:   \n#+roam_tags: %?    \n\nm:   \n%a    \n\n\n- [ ] TODO:   \n\t- [ ]"
                                     ; :unnarrowed t)
                                    
                                     ("g" "gear note for this mechanism" plain (function org-roam--capture-get-point)
                                      :file-name "${slug}"
                                      :head "#+title: ${title}    \n#+roam_alias:   \n#+roam_tags: %?    \n\ng:   \n%a    \n\n\n* TODO:   \n** Добавить контента\n\n* Суть\n\n* Идеи"
                                      :unnarrowed t)

                                     ("s" "simple note" plain (function org-roam--capture-get-point)
                                      :file-name "${slug}"
                                      :head "#+title: ${title}    \n#+roam_alias:   \n#+roam_tags: %?    \n\ng:   \n    \n\n\n* TODO:   \n** Добавить контента\n\n* Суть\n\n* Идеи"
                                      :unnarrowed t)

                                     ("e" "file explanation and additional info" plain (function org-roam--capture-get-point)
                                      :file-name "${slug}"
                                      :head "#+title: ${title}    \n#+roam_alias:   \n#+roam_tags: %?    \n\ne:   \n%a    \n\n\n* TODO:   \n** Добавить контента\n\n* Суть\n\n* Идеи"
                                      :unnarrowed t)

                                     ("t" "gear note for this mechanism" plain (function org-roam--capture-get-point)
                                      :file-name "${slug}"
                                      :head ""
                                      :unnarrowed t)

                                     ))
)

(require 'org-roam-protocol)
(after! org-roam
  (use-package org-roam-server
;    :ensure t
    :config
    (setq org-roam-server-host "127.0.0.1"
          org-roam-server-port 8080
          org-roam-server-export-inline-images t
          org-roam-server-authenticate nil
          org-roam-server-network-poll t ; if `nil', reload using Reload botton (useful when big network)
 ;         org-roam-server-network-arrows "middle"
          org-roam-server-network-label-truncate t
          org-roam-server-network-label-truncate-length 60
          ;org-roam-server-network-vis-options (json-encode (list (cons 'physics (list (cons 'enabled json-false)))))
          org-roam-server-extra-edge-options (list (cons 'width 2))
          org-roam-server-network-label-wrap-length 20))
  (setq org-roam-server-network-arrows "middle")
  (setq org-roam-server-network-vis-options
      (json-encode
       (list (cons 'edges
        (list (cons 'arrows
         (list (cons 'middle
          (list (cons 'scaleFactor -1))))))))))
 )

(defun my-end-of-buffer-dwim (&rest _)
  "Go to beginning of line.
If current line is empty, go to beginning of previous one
instead."
  (beginning-of-line (and (looking-at-p "^$") 0)))
(advice-add #'end-of-buffer :after #'my-end-of-buffer-dwim)

;  (defun org-roam-buffer--insert-backlinks ()
;    "Insert the org-roam-buffer backlinks string for the current buffer."
;    (if-let* ((file-path (buffer-file-name org-roam-buffer--current))
;              (titles (with-current-buffer org-roam-buffer--current
;                        (org-roam--extract-titles)))
;              (backlinks (org-roam--get-backlinks (push file-path titles)))
;              (grouped-backlinks (--group-by (nth 0 it) backlinks)))
;        (progn
;          (insert (let ((l (length backlinks)))
;                    (format "\n\n* %d %s\n"
;                            l (org-roam-buffer--pluralize "Backlink" l))))
;          (dolist (group grouped-backlinks)
;            (let ((file-from (car group))
;                  (bls (cdr group)))
;              (insert (format "** [[file:%s][%s]]\n"
;                              file-from
;                              (org-roam--get-title-or-slug file-from)))
;              (dolist (backlink bls)
;                (pcase-let ((`(,file-from _ ,props) backlink))
;                  (insert (propertize
;                           (s-trim (s-replace "\n" " "
;                                              (plist-get props :content)))
;                           'help-echo "mouse-1: visit backlinked note"
;                           'file-from file-from
;                           'file-from-point (plist-get props :point))
;                          "\n\n"))))))
;      (insert "\n\n* No backlinks!")))

;(require 'org-id)
;(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)

;(defun eos/org-custom-id-get (&optional pom create)
;  "Get the CUSTOM_ID property of the entry at point-or-marker POM.
;   If POM is nil, refer to the entry at point. If the entry does
;   not have an CUSTOM_ID, the function returns nil. However, when
;   CREATE is non nil, create a CUSTOM_ID if none is present
;   already. PREFIX will be passed through to `org-id-new'. In any
;   case, the CUSTOM_ID of the entry is returned."
;  (interactive)
;  (org-with-point-at pom
;    (let ((id (org-entry-get nil "id")))
;      (cond
;       ((and id (stringp id) (string-match "\\S-" id))
;        id)
;       (create
;        (setq id (org-id-new ))
;        (org-entry-put pom "id" id)
;        (org-id-add-location id (buffer-file-name (buffer-base-buffer)))
;        id)))))
;(defun eos/org-add-ids-to-headlines-in-file ()
;  "Add CUSTOM_ID properties to all headlines in the
;   current file which do not already have one."
;  (interactive)
;  (org-map-entries (lambda () (eos/org-custom-id-get (point) 'create))))
;; automatically run
;(add-hook 'org-mode-hook
;          (lambda ()
;            (add-hook 'before-save-hook
;                      (lambda ()
;                        (when (and (eq major-mode 'org-mode)
;                                   (eq buffer-read-only nil))
;                          (eos/org-add-ids-to-headlines-in-file))))))
;
;(defun my/copy-id-to-clipboard()
;  (interactive)
;  (when (eq major-mode 'org-mode)
;    (setq mytmpid (funcall 'org-id-get-create))
;    (kill-new mytmpid)
;    (message "Copied %s to clipboard" mytmpid)))
;
;(global-set-key (kbd "C-c l") 'my/copy-id-to-clipboard)

                                        ; tried to fix evil 's' sityation in org-mode
;(require 'org)
;(define-key org-mode-map (kbd "s") nil)

; 2 lines below to resolve conflicts, but didn't help
;(with-eval-after-load 'org
;  (define-key evil-normal-state-map (kbd "s") 'evil-substitute))
  ;(define-key evil-normal-state-map (kbd "s") 'evil-substitute) ;didn't help
;
; line below to resolve conflicts, but didn't help
;(add-hook 'org-mode-hook (lambda () (define-key evil-normal-state-map (kbd "s") 'evil-substitute)))
;(global-set-key (kbd "H") 'org-brain-add-child-headline) ;не сработало (наверно, все таки, сработало)
;(define-key org-brain (kbd "h") nil) ;не сработало (наверно, все таки, сработало)
 ;
;
; change meta key to win(super) (Better idea to set Super for sustem, ctrl as alt and use Left alt for emacs)
;(setq  x-meta-keysym 'super
;       x-super-keysym 'meta)
