(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_016.
Definition enc_16 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_16 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_16 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_16 : forall o : option nat, dec_16 (enc_16 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_16 : forall o : option nat, enc_16 o = size_16 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_16 : forall o : option nat, enc_16 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_016.

