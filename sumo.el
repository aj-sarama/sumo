;;; -*- lexical-binding: t; -*-

(defvar sumo/color-palette-alist
  '((grayscale1 . (:dark "#0F0F0F" :light "#FFFFFF"))
    (grayscale2 . (:dark "#1F1F1F" :light "#EFEFEF"))
    (grayscale3 . (:dark "#2F2F2F" :light "#DFDFDF"))
    (grayscale4 . (:dark "#3F3F3F" :light "#CFCFCF"))
    (grayscale5 . (:dark "#4F4F4F" :light "#BFBFBF"))
    (grayscale6 . (:dark "#5F5F5F" :light "#AFAFAF"))
    (grayscale7 . (:dark "#6F6F6F" :light "#9F9F9F"))
    (grayscale8 . (:dark "#7F7F7F" :light "#8F8F8F"))
    (grayscale9 . (:dark "#8F8F8F" :light "#7F7F7F"))
    (grayscale10 . (:dark "#9F9F9F" :light "#6F6F6F"))
    (grayscale11 . (:dark "#AFAFAF" :light "#5F5F5F"))
    (grayscale12 . (:dark "#BFBFBF" :light "#4F4F4F"))
    (grayscale13 . (:dark "#CFCFCF" :light "#3F3F3F"))
    (grayscale14 . (:dark "#DFDFDF" :light "#2F2F2F"))
    (grayscale15 . (:dark "#EFEFEF" :light "#1F1F1F"))
    (grayscale16 . (:dark "#FFFFFF" :light "#0F0F0F"))
    (sumo-purple . (:dark "#FF00FF" :light "#6600AA"))
    (sumo-orange . (:dark "#FF6500" :light "#FF4500"))
    (green . (:dark "#00FF66" :light "#006600"))
    (red . (:dark "#FF0000" :light "#FF0000")))
    "Standard color palette for the theme. In the light version, the grayscale will be inverted.")

(cl-defmacro sumo/traverse-alist (alist a b &body body)
  "Traverse an alist, binding local variables a, b to the current key, value respectively."
  (declare (indent 3))
  `(dolist (item ,alist)
     (let ((,a (car item))
	  (,b (cdr item)))
       ,@body)))

(defun sumo/create-hash-from-palette (palette-key)
  "Creates a hash table using the palette in `sumo/color-palette-alist'.
`palette-key' is one of `:light' or `:dark'."
  (let ((table (make-hash-table :test 'eq :weakness t)))
    (sumo/traverse-alist sumo/color-palette-alist sym plist
      (let ((color (plist-get plist palette-key)))
	(puthash sym color table)))
    table))

(defun sumo/create-theme (theme palette-key &optional overrides)
  (let ((table (sumo/create-hash-from-palette palette-key)))
    (when (bound-and-true-p overrides)
      (sumo/traverse-alist overrides key value
	(puthash key value table)))
    (let
	;; g1 is light colored for :light
	;; g1 is dark colored for :dark
       ((g1 (gethash 'grayscale1 table))
       (g2 (gethash 'grayscale2 table))
       (g3 (gethash 'grayscale3 table))
       (g4 (gethash 'grayscale4 table))
       (g5 (gethash 'grayscale5 table))
       (g6 (gethash 'grayscale6 table))
       (g7 (gethash 'grayscale7 table))
       (g8 (gethash 'grayscale8 table))
       (g9 (gethash 'grayscale9 table))
       (g10 (gethash 'grayscale10 table))
       (g11 (gethash 'grayscale11 table))
       (g12 (gethash 'grayscale12 table))
       (g13 (gethash 'grayscale13 table))
       (g14 (gethash 'grayscale14 table))
       (g15 (gethash 'grayscale15 table))
       (g16 (gethash 'grayscale16 table))
       ;; g16 is dark colored for :light
       ;; g16 is light colored for :dark
       (orange (gethash 'sumo-orange table))
       (purple (gethash 'sumo-purple table))
       (red (gethash 'red table))
       (green (gethash 'green table)))
  (custom-theme-set-faces
   theme
   ;; Standard
   `(default ((t (:background ,g2 :foreground ,g16))))
   `(mode-line ((t (:background ,g15 :foreground ,g1))))
   `(mode-line-active ((t (:inherit mode-line :background ,g15 :foreground ,g1))))
   `(mode-line-inactive ((t (:inherit mode-line :background ,g8 :foreground ,g3))))
   `(sly-mode-line ((t (:background nil :foreground ,g1))))
   `(header-line ((t (:background ,g15 :foreground ,g1))))
   `(region ((t (:background ,g4))))
   `(fringe ((t (:inherit default))))
   `(cursor ((t (:background ,purple))))
   `(highlight ((t (:inherit nil :background ,orange :foreground ,g1))))
   `(hl-line ((t (:inherit nil :background ,g3))))
   `(line-number ((t (:inherit default :foreground ,g5))))
   `(line-number-current-line ((t (:background ,g3 :foreground ,g6))))
   `(show-paren-match ((t (:foreground ,orange :bold t))))
   `(button ((t (:foreground ,purple :underline t))))
   `(browse-url-button ((t (:inherit button))))
   `(link ((t (:inherit button))))
   `(link-visited ((t (:inherit link :foreground ,g9))))
   `(isearch ((t (:foreground ,g2 :background ,orange))))
   `(lazy-highlight ((t (:background ,g4))))
   `(error ((t (:foreground ,orange :bold t))))
   `(variable-pitch ((t (:height 1.1))))
   ;; Font lock
   `(font-lock-builtin-face ((t (:foreground ,g13 :italic t))))
   `(font-lock-comment-face ((t (:foreground ,g7 :italic t :weight light))))
   `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
   `(font-lock-constant-face ((t (:inherit default :bold t))))
   `(font-lock-doc-face ((t (:inherit comment :weight light))))
   `(font-lock-doc-markup-face ((t (:inherit font-lock-doc-face :bold t))))
   `(font-lock-function-name-face ((t (:foreground ,orange :bold t))))
   `(font-lock-function-call-face ((t (:foreground ,orange))))
   `(font-lock-keyword-face ((t (:foreground ,purple))))
   `(font-lock-preprocessor-face ((t (:foreground ,g13))))
   `(font-lock-regexp-face ((t (:foreground ,g12))))
   `(font-lock-string-face ((t (:foreground ,g9 :weight light))))
   `(font-lock-type-face ((t (:foreground ,orange :italic t))))
   `(font-lock-variable-name-face ((t (:foreground ,purple :bold t))))
   `(font-lock-variable-use-face ((t (:foreground ,g12))))
   ;; Minibuffer
   `(minibuffer-prompt ((t (:foreground ,purple :bold t))))
   ;; Org
   `(org-hide ((t (:background ,g2 :foreground ,g2))))
   `(outline-1 ((t (:foreground ,orange :height 1.5 :bold t))))
   `(outline-2 ((t (:foreground ,purple :height 1.4 :bold t))))
   `(outline-3 ((t (:foreground ,g16 :height 1.3 :bold t))))
   `(outline-4 ((t (:foreground ,g16 :height 1.2 :bold t))))
   `(outline-5 ((t (:foreground ,g16 :height 1.1 :bold t))))
   `(outline-6 ((t (:foreground ,g16 :height 1.1 :bold t))))
   `(outline-7 ((t (:foreground ,g16 :height 1.1 :bold t))))
   `(outline-8 ((t (:foreground ,g16 :height 1.1 :bold t))))
   `(org-document-title ((t (:foreground ,purple :height 1.5 :bold t))))
   `(org-done ((t (:foreground ,green))))
   `(org-todo ((t (:foreground ,red))))
   `(org-tag ((t (:foreground ,purple :height 0.7 :italic t :bold nil))))
   `(org-headline-done ((t (:foreground ,g7))))
   `(org-scheduled-today ((t (:foreground ,g16))))
   ;; Eshell
   `(eshell-prompt ((t (:inherit nil :foreground ,purple))))
   ;; Sly
   `(sly-mrepl-output-face ((t (:foreground ,orange))))
   ))))

;; sumo-light.el and sumo-dark.el should now show up when themes are loaded
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide 'sumo)
