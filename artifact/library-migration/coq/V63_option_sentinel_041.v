(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_041.
Definition enc_41 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_41 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_41 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_41 : forall o : option nat, dec_41 (enc_41 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_41 : forall o : option nat, enc_41 o = size_41 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_41 : forall o : option nat, enc_41 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_041.

