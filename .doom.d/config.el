;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq org-cycle-separator-lines 2) ; 0 - никак не достичь свободной линии. Но, более интуитивно работать с хедингами (?) Поменял на 2 и не ощутил "более удобной работы"


(setq default-input-method 'russian-computer)

(setq org-default-notes-file (concat org-directory "/notes.org"))

(desktop-save-mode 0) ;trying set marks saving work
;(add-to-list 'desktop-locals-to-save 'evil-markers-alist)
;(cl-pushnew 'evil-markers-alist 'desktop-locals-to-save)
;
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;;(setq doom-font (font-spec :family "iosevka" :size 12 :weight 'regular)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))


;; set Iosevka font only if it available
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


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/knowledge-base/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'visual)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
    ("~/Documents/knowledge-base/3.efficiency/hierarchy-of-issues.org" "~/Documents/knowledge-base/technology/emacs.org")))
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
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(require 'org)
;(define-key org-mode-map (kbd "s") nil)

; 2 lines below to resolve conflicts, but didn't help
;(with-eval-after-load 'org
;  (define-key evil-normal-state-map (kbd "s") 'evil-substitute))
;
; line below to resolve conflicts, but didn't help
;(add-hook 'org-mode-hook (lambda () (define-key evil-normal-state-map (kbd "s") 'evil-substitute)))

(global-set-key (kbd "C-c c") 'org-capture) ;не сработало

(after! org
                                        ; custom templates
  (setq org-capture-templates
        '(
          ;("d" "Demo template" entry ;check the documentation
          ; (file+headline "~/Documents/knowledge-base/3.efficiency/hierarchy-of-issues.org" "Diary") ;file and heading
          ; "* DEMO TEXT %?")

          ;("p" "Prompt us for input" entry ;check the documentation
          ; (file+headline "~/Documents/knowledge-base/3.efficiency/hierarchy-of-issues.org" "Diary") ;file and heading
          ; "* %^{Write here:} %?")

          ;("o" "Select your option" entry ;check the documentation
          ; (file+headline "~/Documents/knowledge-base/3.efficiency/hierarchy-of-issues.org" "Diary") ;file and heading
          ; "* %^{Select option|one|two|three} %?")

          ;("f" "template with date stamp" entry ;check the documentation
          ; (file+headline "~/Documents/knowledge-base/3.efficiency/hierarchy-of-issues.org" "Diary") ;file and heading
          ; "* %^{Select option|one|two|three}\n SCHEDULED: %t\n %?")

          ;("t" "time based templates") ;check the documentation
          ;("tc" "current time template" entry ;check the documentation
          ; (file+headline "~/Documents/knowledge-base/3.efficiency/hierarchy-of-issues.org" "Diary") ;file and heading
          ; "* %^{Select option|one|two|three}\n SCHEDULED: %^t\n %?")

          ;("ts" "template with date and selected area" entry ;check the documentation
          ; (file+headline "~/Documents/knowledge-base/3.efficiency/hierarchy-of-issues.org" "Diary") ;file and heading
          ; "* %^{Select option|one|two|three}\n SCHEDULED: %^t\n %i\n %?")


          ("u" "thoughts for upgrading" item ;check the documentation
           (file+olp "~/Documents/knowledge-base/3.efficiency/hierarchy-of-issues.org" "Diary" "Thoughts for upgrading") ;file and heading
           "%U\n - %?\n ")

          ;("u" "thoughts for upgrading" item ;check the documentation
          ; (file+headline "~/Documents/knowledge-base/3.efficiency/hierarchy-of-issues.org" "Thoughts for upgrading") ;file and heading
          ; "%U\n %?\n ")
          ; что я хочу от темплейта?
          ; 1. Я хочу, чтобы он закидывал в Diary log subtree - другой аргумент, вместо file+headline: file+olp?
          ; 2. чтобы указывал время записи
          ; 3. начинал маркированный список
          ; как назвать? Log? Thuoghts? Done? Experience? I'm better? =Upgrade=? More power?
          ;
          ; пара итераций достижения результата
          ; 1) отправляю как сабтри
          ; 2) пробую отправить не как сабтри (как часть списка,...)
          ;
          ; улучшение:
          ; 1) наблюдение (обсерв)
          ; 2) improvments
          ; 3) idea (to test)

        ;("r" "Dream" entry
        ;   (file+headline +org-capture-todo-file "Dream")
        ;   "* TODO %?")

          )
  )
  (setq org-todo-keywords
        '(
          (sequence "TODO(t)" "PROG(p)" "REV1(1)" "REV2(2)" "REV3(3)" "|" "KILL(k)" "DONE(d)" )
          )
  )
  ;(define-key evil-normal-state-map (kbd "s") 'evil-substitute) ;didn't help
)
;fix end of buffer situation
;(defun my-end-of-buffer-dwim (&rest _)
;  "If current line is empty, call `previous-line'."
;  (when (looking-at-p "^$")
;    (previous-line)))
;
;(advice-add #'end-of-buffer :after #'my-end-of-buffer-dwim)

(defun my-end-of-buffer-dwim (&rest _)
  "Go to beginning of line.
If current line is empty, go to beginning of previous one
instead."
  (beginning-of-line (and (looking-at-p "^$") 0)))

(advice-add #'end-of-buffer :after #'my-end-of-buffer-dwim)
;
;
; change meta key to win(super) (Better idea to set Super for sustem, ctrl as alt and use Left alt for emacs)
;(setq  x-meta-keysym 'super
;       x-super-keysym 'meta)

(setq calendar-week-start-day 1) ; start week from Monday
(setq org-hide-emphasis-markers t) ; org-mode conceall markup
(setq org-startup-folded t) ; fold everything on startup

;(after! org
;  (setq org-todo-keywords
;        '((sequence "TODO(t)" "PROG(p)" |  "DONE(d)" "KILL(k)")
;          )))
;(setq org-todo-keyword-faces
;      '(("TODO" . org-warning) ("STARTED" . "yellow")
;        ("CANCELED" . (:foreground "blue" :weight bold))))
;

                                        ; custom capture templates
;(after! org
;  (add-to-list 'org-capture-templates
;      '(("d", "Demo template" entry ;check the documentation
;         (file+headline "demo.org" "Our first heading") ;file and heading
;         "* DEMO TEXT %?"))
