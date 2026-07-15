(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_020.
Definition enc_20 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_20 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_20 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_20 : forall o : option nat, dec_20 (enc_20 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_20 : forall o : option nat, enc_20 o = size_20 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_20 : forall o : option nat, enc_20 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_020.

