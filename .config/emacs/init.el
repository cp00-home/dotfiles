;; ┬─┐┌┌┐┬─┐┌─┐┐─┐
;; ├─ ││││─┤│  └─┐
;; ┴─┘┘ ┆┘ ┆└─┘──┘

;; Emacs init.el configuration file

(setq user-full-name	"Jan Geldmacher")
(setq user-mail-address	"geldmacher@protonmail.com")

;; faster startup without GUI
(menu-bar-mode -1)

(push '(menu-bar-lines . 0)   default-frame-alist)
(push '(tool-bar-lines . 0)   default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; MELPA package requirements
(require 'all-the-icons)
(require 'dashboard)
(require 'neotree)
(require 'package)
(require 'powerline)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/")
  '("org"   . "https://orgmode.org/elpa/"))
(package-initialize)

;; enable powerline
(defun geldmacher/powerline-reset
    (theme &optional no-confirm no-enable)
    (unless no-enable (powerline-reset)))
(advice-add 'load-theme :before #'geldmacher/powerline-reset)

(powerline-default-theme)
(setq ns-use-rgb-colorspace nil)
(setq powerline-default-separator 'arrow)
(setq powerline-raw " ")
(setq powerline-raw "%l" face1 'l)
(setq powerline-raw "%c" face1 'r)
(setq powerline-raw "%p" face1 'r)

(setq all-the-icons-color-icons nil)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq indent-tabs-mode nil)
(setq site-run-file nil)
(setq tab-always-indent nil)
(setq tab-width 4)

;; look and feel settings
(global-display-line-numbers-mode)
(global-visual-line-mode t)
(global-hl-line-mode)
(make-variable-buffer-local 'global-hl-line-mode)
(show-paren-mode t)

;; enable company mode
(add-hook 'after-init-hook 'global-company-mode)

(setq company-tooltip-minimum-width 50)
(setq company-tooltip-maximum-width 50)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 0)
(setq company-auto-complete nil)
(setq company-require-match nil)
(setq company-selection-wrap-around t)

;; enable custom dashboard
(dashboard-setup-startup-hook)
(add-hook 'dashboard-mode-hook
  (lambda () (setq global-hl-line-mode nil)))

(setq dashboard-banner-logo-title "It always ends like this!")
(setq dashboard-startup-banner "/home/geldmacher/.config/emacs/welcome.png")
(setq dashboard-center-content t)
(setq dashboard-show-shortcuts t)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-init-info t)
(setq dashboard-maximum-section-length 20)

;; enable neotree sidebar
(add-hook 'neo-after-create-hook
	  (lambda (&rest _) (display-line-numbers-mode -1)))

(setq neo-theme 'icons)
(setq neo-smart-open t)
(setq neo-hide-cursor t)
(setq neo-show-hidden-files t)
(setq neo-window-width 35)

(face-spec-set 'neo-file-link-face       '((t (:foreground "#657b83"))))
(face-spec-set 'neo-open-dir-link-face   '((t (:foreground "#006699"))))
(face-spec-set 'neo-dir-link-face        '((t (:foreground "#657b83"))))
(face-spec-set 'neo-dir-icon-face        '((t (:foreground "#657b83"))))
(face-spec-set 'neo-open-dir-icon-face   '((t (:foreground "#006699"))))
(face-spec-set 'neo-root-dir-face        '((t (:foreground "#006699"))))

(global-set-key [f1] 'dashboard-refresh-buffer)
(global-set-key [f8] 'neotree-toggle)

;; enable vim evilmode
(evil-mode 1)

(with-eval-after-load 'neotree 
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q")   'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g")   'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "n")   'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "p")   'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "A")   'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H")   'neotree-hidden-file-toggle))

;; surpress GUI features
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes '(geldmacher))
 '(custom-safe-themes
   '("7a11d67479a07404f5e3685cb83fec5fd0f09edb81608b254e21fcbc793dcfc5" "23b790ca5a0cef17200ecbeb55b93d591ca360a4c33e734b0ae9ae3110c47ded" default))
 '(display-battery-mode nil)
 '(display-line-numbers-type 'relative)
 '(display-time-mode nil)
 '(package-selected-packages
   '(powerline company shrink-path pfuture neotree hydra ht evil dashboard all-the-icons ace-window))
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVuSansMono Nerd Font Mono" :foundry "PfEd" :slant normal :weight normal :height 75 :width normal))))
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:background "#d7d7c4"))))
 '(company-scrollbar-fg ((t (:background "#657b83"))))
 '(company-tooltip ((t (:background "#d7d7c4" :foreground "#657b83"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "#d7d7c4" :foreground "#006699"))))
 '(dashboard-footer ((t (:inherit font-lock-doc-face :foreground "gray"))))
 '(hl-line ((t (:inherit highlight :extend t)))))
