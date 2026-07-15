(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_024.
Definition enc_24 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_24 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_24 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_24 : forall o : option nat, dec_24 (enc_24 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_24 : forall o : option nat, enc_24 o = size_24 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_24 : forall o : option nat, enc_24 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_024.

