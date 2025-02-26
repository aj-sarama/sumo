;;; -*- lexical-binding: t; -*-
(require 'sumo)
(deftheme sumo-dark "Black with orange and purple accents.")

(defvar sumo/sumo-dark-palette-overrides '())

(sumo/create-theme 'sumo-dark :dark sumo/sumo-dark-palette-overrides)

(provide-theme 'sumo-dark)
