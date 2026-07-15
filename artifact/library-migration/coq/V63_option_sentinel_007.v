(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_007.
Definition enc_7 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_7 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_7 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_7 : forall o : option nat, dec_7 (enc_7 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_7 : forall o : option nat, enc_7 o = size_7 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_7 : forall o : option nat, enc_7 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_007.

