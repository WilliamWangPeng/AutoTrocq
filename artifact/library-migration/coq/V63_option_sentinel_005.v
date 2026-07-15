(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_005.
Definition enc_5 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_5 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_5 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_5 : forall o : option nat, dec_5 (enc_5 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_5 : forall o : option nat, enc_5 o = size_5 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_5 : forall o : option nat, enc_5 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_005.

