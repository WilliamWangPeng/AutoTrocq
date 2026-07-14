(* V60 case-study module *)
(* PATTERN: boolean encoding *)
(* TRANSFER_SHAPE: section *)

Module V60_BoolNatEncoding.
Definition enc (b : bool) : nat := if b then 1 else 0.
Definition dec (n : nat) : bool := match n with | 0 => false | _ => true end.
Definition neg_nat (n : nat) : nat := if dec n then 0 else 1.

Theorem dec_enc : forall b : bool, dec (enc b) = b.
Proof.
  destruct b; reflexivity.
Qed.

Theorem enc_dec_canonical : forall b : bool, enc (negb b) = neg_nat (enc b).
Proof.
  destruct b; reflexivity.
Qed.

Theorem encoded_true_not_zero : enc true <> 0.
Proof.
  discriminate.
Qed.
End V60_BoolNatEncoding.

