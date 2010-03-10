(add-to-list 'load-path "~/.emacs.d/jonas")
(add-to-list 'load-path "~/Projects/jpl-mode")
(add-to-list 'load-path "~/src/taskpaper-el")

(setq load-path (cons "~/src/org-mode/lisp" load-path))
(require 'org)

(require 'color-theme)
(load "inkpot.el")
(load "chocolate-rain.el")
(load "taskpaper.el")
(color-theme-chocolate-rain)

(ido-mode t)
(setq ido-enable-flex-matching t)


(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(set-register ?t '(file . "/Volumes/Daten/Docs/notes/todo.org"))

;; Disable flyspell-mode when opening org files
(dolist (hook '(org-mode-hook))
  (add-hook hook (lambda ()
                    (flyspell-mode -1))))

;; Directory shortcuts
(global-set-key [f3] 'ffap)
(define-key minibuffer-local-completion-map (kbd "<f3>")
  'complete-minibuffer-path)
(defun complete-minibuffer-path ()
  "Extenstion to the complete word facility of the minibuffer
by replacing matching strings to a specific path"
  (interactive)
  (setq found t)
  (cond
   ((looking-back "n" 5 nil) (setq directory "/Volumes/Daten/Docs/notes/"))
   ((looking-back "u" 5 nil) (setq directory "/Volumes/Daten/Docs/uni/"))
   ((looking-back "d" 5 nil) (setq directory "/Volumes/Daten/Docs/dds/"))
   ((looking-back "docs" 5 nil) (setq directory "/Volumes/Daten/Docs/"))
   (t (setq found nil)))
  (cond (found (beginning-of-line)
               (kill-line)
               (insert directory))
        (t (minibuffer-complete))))

(global-hl-line-mode 1)
(set-face-background 'hl-line "#330")

(setq org-directory "/Volumes/Daten/Docs/notes")
(setq org-mobile-files '("/Volumes/Daten/Docs/notes/index.org" "/Volumes/Daten/Docs/notes/todo.org"))
(setq org-mobile-directory "/Volumes/jonasoberschweiber/org")
(setq org-mobile-inbox-for-pull "/Volumes/Daten/Docs/notes/in.org")

(setq ns-command-modifier (quote meta))
(setq mac-option-key-is-meta nil)
(setq mac-option-modifier nil)

(setq c-default-style "java")

(setq-default c-basic-offset 4
              tab-width 4)

(cond
 ((string-match "nt" system-configuration)
  (custom-set-faces
   '(default ((t (:stipple nil :background "#1e1e27" :foreground "#cfbfad" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 110 :width ultra-condensed :family "ProggyTinyTTSZ"))))))
 (t
  (custom-set-faces
 '(default ((t (:stipple nil :background "#1e1e27" :foreground "#cfbfad" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 110 :width ultra-condensed :family "Inconsolata")))))))