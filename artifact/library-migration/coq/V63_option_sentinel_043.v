(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_043.
Definition enc_43 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_43 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_43 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_43 : forall o : option nat, dec_43 (enc_43 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_43 : forall o : option nat, enc_43 o = size_43 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_43 : forall o : option nat, enc_43 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_043.

