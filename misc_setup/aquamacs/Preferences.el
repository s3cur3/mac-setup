;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

(load "thrift-mode.el")
(load "wc.el")

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.text" . markdown-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize Font Faces
;; http://www.emacswiki.org/emacs/CustomizingFaces
(custom-set-faces
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.1))))
 '(org-level-1 ((t (:inherit org-level-1 :height 1.4))))
 '(org-level-2 ((t (:inherit org-level-2 :height 1.2))))
)


;; Changing Colors
(set-background-color "black")
(set-foreground-color "white")


;; Fix the fact that Home and End take you to the beg. and end of BUFFER
(define-key osx-key-mode-map [home] 'move-beginning-of-line)
(define-key osx-key-mode-map  [end] 'move-end-of-line)

(define-key osx-key-mode-map [A-home] 'beginning-of-buffer)
(define-key osx-key-mode-map  [A-end] 'end-of-buffer)

;; Markdown preview via Marked
(defun markdown-preview-file ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command 
   (format "open -a /Applications/Marked.app %s" 
       (shell-quote-argument (buffer-file-name))))
)
(global-set-key "\C-cm" 'markdown-preview-file)


;; easy keys to split window. Key based on ErgoEmacs keybinding
(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-4") 'split-window-horizontally) ; split pane top/bottom
(global-set-key (kbd "M-5") 'split-window-vertically) ; split pane top/bottom
(global-set-key (kbd "M-s") 'other-window) ; cursor to other pane
(global-set-key (kbd "M-0") 'delete-window) ; close current pane
; note: syntax for F5 key is (kbd "<f5>")

; Alias the boring list-buffer mode with ibuffer -- use C-x C-b to view
(defalias 'list-buffers 'ibuffer)

(require 'color-theme-zenburn)
(color-theme-zenburn)
