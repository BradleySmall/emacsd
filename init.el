(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(require 'package)
(package-initialize)
(package-refresh-contents)

(load-theme 'sanityinc-solarized-dark t)
(set-mouse-color "LightSkyBlue")
(set-cursor-color "LightSkyBlue")


(set-default 'truncate-lines t)

;;;;
;;;(cua-mode t)
;;;(cua-selection-mode t)
;;;(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;;;(transient-mark-mode 1) ;; No region when it is not highlighted
;;;(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
;;;;

;; Download Evil
;; (unless (package-installed-p 'evil)
;;  (package-install 'evil))

;; Enable Evil
;; (require 'evil)
(evil-mode 1)

;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(delete-selection-mode 1)
(setq-default indent-tabs-mode nil)

(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms `((".*" ,"~/.emacs.d/backups" t)))
(setq tramp-backup-directory-alist backup-directory-alist)
(setq column-number-mode t)
(setq line-number-mode t)

(show-paren-mode 1)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq inferior-lisp-program "/usr/local/src/ccl/lx86cl64")

(require 'ac-sly)
(add-hook 'sly-mode-hook 'set-up-sly-ac)
(add-hook 'sly-repl-mode-hook 'set-up-sly-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'sly-repl-mode))

(defvar proj-name)
(defvar load-cmd)
(defvar ut-cmd)

(defun loadtest()
  (interactive)
  (setq proj-name
        (format  "%s" (file-name-sans-extension
                       (file-name-nondirectory
                        (buffer-file-name)))))
  (setq load-cmd
        (format "(load \"%s\")" proj-name))
  (setq ut-cmd
        (format "(lisp-unit::run-tests :all  :%s)" proj-name))
  (sly-eval-with-transcript `(slynk:interactive-eval, load-cmd)))

(defun unittest()
  (interactive)
  (sly-eval-with-transcript `(slynk:interactive-eval,
                             ut-cmd)))


(require 'desktop)
(desktop-save-mode 1)
(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)

;;; desktop-override-stale-locks.el begins here
(defun emacs-process-p (pid)
  "If pid is the process ID of an emacs process, return t, else nil.
Also returns nil if pid is nil."
  (when pid
    (let* ((cmdline-file (concat "/proc/" (int-to-string pid) "/cmdline")))
      (when (file-exists-p cmdline-file)
        (with-temp-buffer
          (insert-file-contents-literally cmdline-file)
          (goto-char (point-min))
          (search-forward "emacs" nil t)
          pid)))))

(defadvice desktop-owner (after pry-from-cold-dead-hands activate)
  "Don't allow dead emacsen to own the desktop file."
  (when (not (emacs-process-p ad-return-value))
    (setq ad-return-value nil)))
;;; desktop-override-stale-locks.el ends here


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-mode t)
 '(package-selected-packages
   (quote
    (flycheck flycheck-clojure flycheck-haskell flylisp flymake-go flymake-golangci flymake-haskell-multi flymake-shell flymake-shellcheck evil-args evil-avy evil-better-visual-line evil-cleverparens evil-collection evil-commentary evil-easymotion evil-ediff evil-embrace evil-ex-shell-command evil-exchange evil-expat evil-extra-operator evil-find-char-pinyin evil-fringe-mark evil-god-state evil-goggles evil-iedit-state evil-indent-plus evil-indent-textobject evil-leader evil-ledger evil-lion evil-lisp-state evil-lispy evil-magit evil-mark-replace evil-matchit evil-mc evil-mc-extras evil-multiedit evil-nerd-commenter evil-nl-break-undo evil-numbers evil-opener evil-org evil-owl evil-paredit evil-python-movement evil-quickscope evil-replace-with-char evil-replace-with-register evil-rsi evil-search-highlight-persist evil-smartparens evil-snipe evil-space evil-string-inflection evil-surround evil-swap-keys evil-tabs evil-terminal-cursor-changer evil-test-helpers evil-text-object-python evil-textobj-anyblock evil-textobj-column evil-textobj-entire evil-textobj-line evil-textobj-syntax evil-traces evil-vimish-fold evil-visual-mark-mode evil-visual-replace evil-visualstar org-evil 0x0 iedit sly-repl-ansi-color sly-named-readtables ac-sly sly-asdf helm-sly sly-macrostep sly-quicklisp sly clang-format rainbow-delimiters qsimpleq-theme org lorem-ipsum color-theme-sanityinc-solarized))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
