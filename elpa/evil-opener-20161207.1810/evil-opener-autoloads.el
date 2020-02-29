;;; evil-opener-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "evil-opener" "evil-opener.el" (0 0 0 0))
;;; Generated autoloads from evil-opener.el

(autoload 'evil-opener-mode "evil-opener" "\
Buffer-local minor mode to activate evil-opener remappings.

\(fn &optional ARG)" t nil)

(defvar global-evil-opener-mode nil "\
Non-nil if Global Evil-Opener mode is enabled.
See the `global-evil-opener-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-evil-opener-mode'.")

(custom-autoload 'global-evil-opener-mode "evil-opener" nil)

(autoload 'global-evil-opener-mode "evil-opener" "\
Toggle Evil-Opener mode in all buffers.
With prefix ARG, enable Global Evil-Opener mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Evil-Opener mode is enabled in all buffers where
`(lambda nil (evil-opener-mode 1))' would do it.
See `evil-opener-mode' for more information on Evil-Opener mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("evil-opener-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-opener-autoloads.el ends here
