(* V64 robustness-matrix module *)
Module V64_REJECT_MISSING_CASE_022.
Definition enc_302 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Theorem bad_none_302 : forall n, enc_302 (Some n) = 0.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_MISSING_CASE_022.

