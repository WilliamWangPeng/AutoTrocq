(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_029.
Definition enc_29 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_29 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_29 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_29 : forall o : option nat, dec_29 (enc_29 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_29 : forall o : option nat, enc_29 o = size_29 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_29 : forall o : option nat, enc_29 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_029.

