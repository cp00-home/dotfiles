(deftheme geldmacher
  "Created 2020-04-29.")

(custom-theme-set-faces
 'geldmacher
 '(cursor ((t (:background "#c7c7b4" :foreground "#006699" :weight bold))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 '(escape-glyph ((t (:foreground "#657b83"))))
 '(homoglyph ((t (:foreground "#657b83"))))
 '(minibuffer-prompt ((t (:foreground "#657b83"))))
 '(highlight ((t (:background "#d7d7c4"))))
 '(region ((((class color) (min-colors 88) (background dark)) (:extend t :background "blue3")) (((class color) (min-colors 88) (background light) (type gtk)) (:extend t :background "gtk_selection_bg_color" :distant-foreground "gtk_selection_fg_color")) (((class color) (min-colors 88) (background light) (type ns)) (:extend t :background "ns_selection_bg_color" :distant-foreground "ns_selection_fg_color")) (((class color) (min-colors 88) (background light)) (:extend t :background "lightgoldenrod2")) (((class color) (min-colors 16) (background dark)) (:extend t :background "blue3")) (((class color) (min-colors 16) (background light)) (:extend t :background "lightgoldenrod2")) (((class color) (min-colors 8)) (:extend t :foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:extend t :background "gray"))))
 '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
 '(secondary-selection ((t (:extend t :foreground "gray" :background "DeepSkyBlue4"))))
 '(trailing-whitespace ((t (:background "light sea green"))))
 '(font-lock-builtin-face ((t (:foreground "#657b83"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "dim gray" :inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "#657b83"))))
 '(font-lock-constant-face ((((class grayscale) (background light)) (:underline (:color foreground-color :style line) :weight bold :foreground "LightGray")) (((class grayscale) (background dark)) (:underline (:color foreground-color :style line) :weight bold :foreground "Gray50")) (((class color) (min-colors 88) (background light)) (:foreground "dark cyan")) (((class color) (min-colors 88) (background dark)) (:foreground "Aquamarine")) (((class color) (min-colors 16) (background light)) (:foreground "CadetBlue")) (((class color) (min-colors 16) (background dark)) (:foreground "Aquamarine")) (((class color) (min-colors 8)) (:foreground "magenta")) (t (:underline (:color foreground-color :style line) :weight bold))))
 '(font-lock-doc-face ((t (:foreground "gray" :inherit (font-lock-string-face)))))
 '(font-lock-function-name-face ((t (:foreground "steel blue"))))
 '(font-lock-keyword-face ((t (:foreground "DeepSkyBlue4"))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:foreground "#657b83" :inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "dark gray"))))
 '(font-lock-type-face ((t (:foreground "dark cyan"))))
 '(font-lock-variable-name-face ((t (:foreground "DarkSlateGray4"))))
 '(font-lock-warning-face ((t (:inherit (error)))))
 '(button ((t (:inherit (link)))))
 '(link ((t (:underline (:color foreground-color :style line) :foreground "#657b83"))))
 '(link-visited ((t (:foreground "violet red" :inherit (link)))))
 '(fringe ((t (:background "#e7e7d4"))))
 '(header-line ((t (:box nil :foreground "grey20" :background "grey90" :inherit (mode-line)))))
 '(tooltip ((t (:foreground "black" :background "lightyellow" :inherit (variable-pitch)))))
 '(mode-line ((t (:foreground "#e7e7d4" :background "#657b83"))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((t (:foreground "#006699" :weight bold))))
 '(mode-line-inactive ((t (:weight light :box (:line-width -1 :color "grey75" :style nil) :foreground "#657b83" :background "#d7d7c4" :inherit (mode-line)))))
 '(isearch ((t (:foreground "white" :background "#006699"))))
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1")) (((class color) (min-colors 88) (background dark)) (:background "red4")) (((class color) (min-colors 16)) (:background "red")) (((class color) (min-colors 8)) (:background "red")) (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 '(lazy-highlight ((t (:foreground "white" :background "#d7d7c4"))))
 '(match ((t (:foreground "white" :background "#006699"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch)))))
 '(powerline-active0 ((t (:inherit mode-line))))
 '(powerline-active1 ((t (:background "#d7d7c4" :foreground "#657b83"))))
 '(powerline-active2 ((t (:foreground "#657b83" :background "#e7e7d4"))))
 '(powerline-inactive0 ((t (:inherit (mode-line-inactive)))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "#d7d7c4"))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "#d7d7c4"))))
 '(show-paren-match ((t (:background "#d7d7c4" :foreground "#006699" :weight bold))))
 '(show-paren-match-expression ((t (:inherit show-paren-match))))
 '(default ((t (:family "DejaVuSansMono Nerd Font Mono" :foundry "PfEd" :width normal :height 75 :weight normal :slant normal :underline nil :overline nil :extend nil :strike-through nil :box nil :inverse-video nil :foreground "#657B83" :background "#e7e7d4" :stipple nil :inherit nil)))))

(provide-theme 'geldmacher)
