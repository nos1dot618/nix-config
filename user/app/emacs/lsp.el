;; Install major-modes
(dolist (pkg '(nix-mode
               markdown-mode
               ;; Add more packages here
               ))
  (eval `(use-package ,pkg :defer t)))

