;;; -*- lexical-binding: t; -*-
(require 'sumo)
(deftheme sumo-light "White with orange and purple accents.")

(defvar sumo/sumo-light-palette-overrides '()
  "Plist of the form `(color-sym . \"#ABCDEF\")'")

(sumo/create-theme 'sumo-light :light sumo/sumo-light-palette-overrides)

(provide-theme 'sumo-light)
