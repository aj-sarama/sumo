;;; -*- lexical-binding: t; -*-

(defvar ajs/color-palette-alist
  ;; test comment, can you see this?
  '((grayscale1 . "#0F0F0F")
    (grayscale2 . "#1F1F1F")
    (grayscale3 . "#2F2F2F")
    (grayscale4 . "#3F3F3F")
    (grayscale5 . "#4F4F4F")
    (grayscale6 . "#5F5F5F")
    (grayscale7 . "#6F6F6F")
    (grayscale8 . "#7F7F7F")
    (grayscale9 . "#8F8F8F")
    (grayscale10 . "#9F9F9F")
    (grayscale11 . "#AFAFAF")
    (grayscale12 . "#BFBFBF")
    (grayscale13 . "#CFCFCF")
    (grayscale14 . "#DFDFDF")
    (grayscale15 . "#EFEFEF")
    (grayscale16 . "#FFFFFF")
    (color . "#8400FF")
    (color-darker . "#6600AA")
    (important . "#FF0000")))

(cl-defmacro ajs/bind-color-palette (palette &body body)
  "Binds the colors in the alist to local variables."
  (declare (indent 1))
  `(let ,(mapcar (lambda (item)
                   `(,(car item) ,(cdr item)))
                 (eval palette))
     ,@body))

(intern "hey!")

(deftheme ajs/theme "AJ's theme!")

;; test comment for readability
(set-face-attribute 'default nil :background "#FAFAFA" :foreground "#0F0F0F")
(set-face-attribute 'font-lock-comment-face nil :foreground "#9F9F9F" :italic t)
(set-face-attribute 'font-lock-keyword-face nil :foreground "#7F7F7F" :italic t :underline t)
(set-face-attribute 'font-lock-string-face nil :foreground "#5F5F5F" :italic t)
(set-face-attribute 'font-lock-doc-face nil :foreground "#5F5F5F" :italic t)
(set-face-attribute 'mode-line nil :foreground "#FFFFFF" :background "#330088")
(set-face-attribute 'header-line nil :foreground "#0F0F0F" :background "#CFCFCF")
(set-face-attribute 'font-lock-type-face nil :foreground "#3B3B3B" :underline nil :bold t)
(set-face-attribute 'font-lock-builtin-face nil :foreground "#3B3B3B" :italic t :underline nil)
(set-face-attribute 'font-lock-function-name-face nil :background "#0000FF" :foreground "#FFFFFF" :italic t :bold t)
(set-face-attribute 'line-number nil :background "#EFEFEF" :foreground "#BFBFBF")
(set-face-attribute 'highlight nil :background "#FF0000" :foreground "#FFFFFF" :bold t)
(set-face-attribute 'show-paren-match nil :background "#FF0000" :foreground "#FFFFFF" :bold t)
(set-face-attribute 'cursor nil :background "#6600AA" :foreground "#0F0F0F")
(set-face-attribute 'isearch nil :background "#0F0F0F" :foreground "#FFFFFF" :bold t)
(set-face-attribute 'isearch-group-1 nil :background "#6600AA" :foreground "#FFFFFF" :bold t)
(set-face-attribute 'modus-themes-search-lazy nil :background "#DFDFDF" :foreground "#0F0F0F" :bold t)

(ajs/bind-color-palette ajs/color-palette-alist
  (custom-theme-set-faces
   ajs/theme
   
  
			


(provide-theme ajs/theme)
