(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_044.
Definition enc_44 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_44 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_44 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_44 : forall o : option nat, dec_44 (enc_44 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_44 : forall o : option nat, enc_44 o = size_44 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_44 : forall o : option nat, enc_44 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_044.

