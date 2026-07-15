(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_010.
Definition enc_10 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_10 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_10 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_10 : forall o : option nat, dec_10 (enc_10 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_10 : forall o : option nat, enc_10 o = size_10 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_10 : forall o : option nat, enc_10 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_010.

