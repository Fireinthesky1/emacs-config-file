(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(custom-safe-themes nil)
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(cuda-mode use-package doom-themes magit iedit fill-column-indicator multiple-cursors gruvbox-theme diff-hl)))

;; Add Melpa repository if you haven't already
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Install diff-hl if not installed
(unless (package-installed-p 'diff-hl)
  (package-refresh-contents)
  (package-install 'diff-hl))

;; Stop Emacs from losing undo information
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

;; Enable the visual line mode
(global-visual-line-mode 1)

;; Enable line numbers
(global-display-line-numbers-mode t)

(require 'lsp)

;; Enable LSP for CUDA C mode
(add-hook 'cuda-mode-hook (lambda ()
                            (condition-case nil
                                (lsp)
                              (error nil))))

;; Enable LSP for C mode
(add-hook 'c-mode-hook (lambda ()
                         (condition-case nil
                             (lsp)
                           (error nil))))

;; Enable LSP for C++ mode
(add-hook 'c++-mode-hook (lambda ()
                           (condition-case nil
                               (lsp)
                             (error nil))))

;; Enable LSP for Python mode
(add-hook 'python-mode-hook (lambda ()
                               (condition-case nil
                                   (lsp)
                                 (error nil))))

;; Enable LSP for VHDL mode
(add-hook 'vhdl-mode-hook (lambda ()
                             (condition-case nil
                                 (lsp)
                               (error nil))))

;; Enable LSP for Verilog mode
(add-hook 'verilog-mode-hook (lambda ()
                                (condition-case nil
                                    (lsp)
                                  (error nil))))


(autoload 'cuda-mode "cuda-mode" "Mode for editing CUDA C/C++ files" t)
(add-to-list 'auto-mode-alist '("\\.cu\\'" . cuda-mode))


(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/src/linux-trees")
                                       filename))
                (setq indent-tabs-mode t)
                (setq show-trailing-whitespace t)
                (c-set-style "linux-tabs-only")))))

;; Remove trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set fill column to 80 characters and require final newline
(setq-default fill-column 80
              require-final-newline t)

;; Enable electric-pair mode for auto-insertion of pairs
(electric-pair-mode 1)

;; Set up Emacs to use UTF-8 encoding
(prefer-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)

;; Set default font
(set-frame-font "DejaVu Sans Mono 12" nil t)

;; Set up uniquify to handle buffer names with the same filename
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Use diff-hl to highlight VCS diffs in the fringe
(global-diff-hl-mode)

;; Disable the menu bar, tool bar, and scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Map M-p to M-up arrow
(global-set-key (kbd "M-p") (kbd "<C-up>"))

;; Map C-n to C-down arrow
(global-set-key (kbd "M-n") (kbd "<C-down>"))

;; Bright-red TODOs
(font-lock-add-keywords
 'c++-mode
 '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)))
(font-lock-add-keywords
 'c-mode
 '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)))
(add-hook 'asm-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)))))
(add-hook 'vhdl-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)))))

;; Disable the startup screen
(setq inhibit-startup-screen t)

;; Install fill-column-indicator
(use-package fill-column-indicator
  :ensure t)
(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(add-hook 'prog-mode-hook 'fci-mode)

;; Enable multiple cursors for multiline editing
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(defun my/mc/edit-lines-like-notepad++ ()
  "Starts multiple cursors on the active region, like in Notepad++."
  (interactive)
  (mc/edit-lines (region-beginning) (region-end)))

(global-set-key (kbd "M-<up>") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-<down>") 'mc/mark-next-like-this)
(global-set-key (kbd "M-<right>") 'mc/mark-next-like-this-word)
(global-set-key (kbd "M-<left>") 'mc/mark-previous-like-this-word)
(global-set-key (kbd "M-<return>") 'my/mc/edit-lines-like-notepad++)

;; Move lines up and down
(global-set-key (kbd "C-S-<up>") 'move-line-up)
(global-set-key (kbd "C-S-<down>") 'move-line-down)

(defun move-line-up ()
  "Move the current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  "Move the current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

;; BRIGHT PURPLE NOTE
(defun my-font-lock-add-keywords ()
  "Highlight NOTE comments in bright purple."
  (font-lock-add-keywords
   nil
   '(("\\<\\(NOTE\\)\\>"
      1 '(:foreground "brightmagenta" :weight bold) t))))

(add-hook 'asm-mode-hook 'my-font-lock-add-keywords)
(add-hook 'vhdl-mode-hook 'my-font-lock-add-keywords)
(add-hook 'c-mode-hook 'my-font-lock-add-keywords)
(add-hook 'c++-mode-hook 'my-font-lock-add-keywords)

;; Enable electric-pair-mode for C and VHDL modes
(add-hook 'c-mode-common-hook 'electric-pair-mode)
(add-hook 'vhdl-mode-hook 'electric-pair-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
