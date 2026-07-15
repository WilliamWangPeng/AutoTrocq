(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_026.
Definition enc_26 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_26 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_26 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_26 : forall o : option nat, dec_26 (enc_26 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_26 : forall o : option nat, enc_26 o = size_26 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_26 : forall o : option nat, enc_26 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_026.

