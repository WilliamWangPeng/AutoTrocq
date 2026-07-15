(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_006.
Definition enc_6 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_6 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_6 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_6 : forall o : option nat, dec_6 (enc_6 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_6 : forall o : option nat, enc_6 o = size_6 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_6 : forall o : option nat, enc_6 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_006.

