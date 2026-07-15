(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_050.
Definition enc_50 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_50 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_50 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_50 : forall o : option nat, dec_50 (enc_50 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_50 : forall o : option nat, enc_50 o = size_50 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_50 : forall o : option nat, enc_50 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_050.

