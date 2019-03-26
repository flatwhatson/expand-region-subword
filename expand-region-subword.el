;;; expand-region-subword.el --- subword-mode support for expand-region -*- lexical-binding: t -*-

;; Copyright (C) 2019  Free Software Foundation, Inc.

;; Author: Andrew Whatson <whatson@gmail.com>
;; Keywords: convenience
;; Version: 0.1.0
;; Package-Requires: ((emacs "25.1") (expand-region "0.11.0"))
;; URL: https://github.com/flatwhatson/expand-region-subword

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Additional expansions for `expand-region' when `subword-mode' is enabled.

;;; Code:

(define-obsolete-variable-alias 'er/enable-subword-mode?
  'expand-region-subword-enabled "2019-03-23")

(defcustom expand-region-subword-enabled t
  "Whether expand-region should use subword expansions."
  :group 'expand-region
  :type '(choice (const :tag "Enable subword expansions" t)
                 (const :tag "Disable subword expansions" nil)))

(eval-after-load 'subword '(require 'subword-mode-expansions))

(provide 'expand-region-subword)
;;; expand-region-subword.el ends here
